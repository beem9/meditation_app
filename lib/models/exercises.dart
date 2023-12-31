class Exercises {
  int? id;
  String? title;
  String? file;
  bool? finished;

  Exercises({
    this.id,
    this.title,
    this.file,
    this.finished,
  });

  Exercises.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    file = json['file'] as String?;
    finished = json['finished'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['file'] = file;
    json['finished'] = finished;
    return json;
  }
}
