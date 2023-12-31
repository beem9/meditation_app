class Meditation {
  int? id;
  String? title;
  String? file;

  Meditation({
    this.id,
    this.title,
    this.file,
  });

  Meditation.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    file = json['file'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['file'] = file;
    return json;
  }
}
