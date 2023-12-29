class Tips {
  int? id;
  String? text;
  String? author;
  List<dynamic>? upvotes;
  List<dynamic>? downvotes;

  Tips({
    this.id,
    this.text,
    this.author,
    this.upvotes,
    this.downvotes,
  });

  Tips.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    text = json['text'] as String?;
    author = json['author'] as String?;
    upvotes = json['upvotes'] as List?;
    downvotes = json['downvotes'] as List?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['text'] = text;
    json['author'] = author;
    json['upvotes'] = upvotes;
    json['downvotes'] = downvotes;
    return json;
  }
}
