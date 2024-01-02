import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPage extends StatefulWidget {
  VideoPage({required this.combinedParams});
  final String combinedParams;

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;

  late String link; // Declare link here
  late String title;

  @override
  void initState() {
    super.initState();
    // widget.combinedParams['title'];
    final params = widget.combinedParams.split(',');
    link = getLastMediaLink(params[0]); // Extract the video link
    print(link);
    title = params[1];

    _initializeVideoPlayer(link);
  }

  String getLastMediaLink(String input) {
    List<String> links = input.split("http");
    String? lastMp4Link;
    String? lastMp3Link;

    for (int i = links.length - 1; i >= 0; i--) {
      String trimmedLink = links[i].trim();
      if (trimmedLink.endsWith(".mp4")) {
        lastMp4Link = "https$trimmedLink";
        break;
      } else if (trimmedLink.endsWith(".mp3")) {
        lastMp3Link = "https$trimmedLink";
        break;
      }
    }

    print(lastMp4Link);
    print(lastMp3Link);

    if (lastMp4Link != null) {
      return lastMp4Link;
    } else if (lastMp3Link != null) {
      return lastMp3Link;
    } else {
      return "No mp4 or mp3 link found";
    }
  }

  Future<void> _initializeVideoPlayer(String link) async {
    try {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(link));

      await _videoPlayerController.initialize();

      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: false,
          looping: true,
          aspectRatio: 16 / 9,
        );
        _isLoading = false;
      });
    } catch (e) {
      print("Error initializing video player: $e");
      // Handle error, show error message, etc.
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Stack(
        children: [
          if (!_isLoading &&
              _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized)
            Center(
              child: Chewie(controller: _chewieController!),
            ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
