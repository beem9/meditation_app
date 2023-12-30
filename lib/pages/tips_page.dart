import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/widgets/dialog_tip.dart';
import 'package:provider/provider.dart';

class TipsScreen extends StatefulWidget {
  TipsScreen({Key? key}) : super(key: key);

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Book app"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddTipDialog();
                },
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<TipProvider>().tipList(),
        builder: (context, snapshot) {
<<<<<<< HEAD
          int likes = 1;
          return Consumer<TipProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: value.tipsList.length,
              itemBuilder: (context, index) {
                final upvotesCount = context
                        .watch<TipProvider>()
                        .tipsList[index]
                        .upvotes
                        ?.length ??
                    0;
                final downvotesCount = context
                        .watch<TipProvider>()
                        .tipsList[index]
                        .downvotes
                        ?.length ??
                    0;
                dynamic totalVotes = upvotesCount - downvotesCount;
=======
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data'),
            );
          } else {
            return Consumer<TipProvider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: value.tipsList.length,
                itemBuilder: (context, index) {
                  final upvotesCount =
                      value.tipsList[index].upvotes?.length ?? 0;
                  final downvotesCount =
                      value.tipsList[index].downvotes?.length ?? 0;
                  final totalVotes = upvotesCount - downvotesCount;
>>>>>>> b1253402a5a937b9f83ed85cce11c1aebfab5635

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
<<<<<<< HEAD
                                IconButton(
                                  icon: Icon(Icons.arrow_upward),
                                  onPressed: () {
                                    // Upvote logic
                                    context
                                        .read<TipProvider>()
                                        .upVouteTip(value.tipsList[index].id!);
                                    context.read<TipProvider>().tipList();
                                  },
                                ),
                                Text(
                                  "${totalVotes}"

                                  //            value.tipsList[index].upvotes.length.toString(),

                                  , // Replace this with the actual vote count
                                  style: TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_downward),
                                  onPressed: () {
                                    context
                                        .read<TipProvider>()
                                        .downVoteTip(value.tipsList[index].id!);
                                    context.read<TipProvider>().tipList();
                                    // Downvote logic
                                  },
=======
                                Text(
                                  value.tipsList[index].text.toString(),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  value.tipsList[index].author.toString(),
                                  style: TextStyle(fontSize: 14.0),
>>>>>>> b1253402a5a937b9f83ed85cce11c1aebfab5635
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_upward),
                                    onPressed: () {
                                      context.read<TipProvider>().upVouteTip(
                                          value.tipsList[index].id!);
                                    },
                                  ),
                                  Text(
                                    '$totalVotes',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_downward),
                                    onPressed: () {
                                      context.read<TipProvider>().downVoteTip(
                                          value.tipsList[index].id!);
                                    },
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    context
                                        .read<TipProvider>()
                                        .deleteTip(value.tipsList[index].id!);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  likes(int ups, int down, index) {
    int like = TipProvider().tipsList[index].upvotes!.length;
    int dislikes = TipProvider().tipsList[index].downvotes!.length;
    int total = like - dislikes;
    return total;
  }
}
