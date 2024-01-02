class Music {
  int? id;
  String? title;
  String? file;
  bool? isFavorite;

  Music({this.id, this.title, this.file, this.isFavorite});

  Music.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    file = json['file'] as String?;
    isFavorite = json['isFavorite'] as bool? ?? false; // Default value is false
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['file'] = file;
    json['isFavorite'] = isFavorite;
    return json;
  }
}
