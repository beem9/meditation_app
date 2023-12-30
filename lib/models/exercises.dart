// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Exercises {
  final int id;
  final String title;
  final String file;
  final bool finished;

  Exercises({
    required this.id,
    required this.title,
    required this.file,
    required this.finished,
  });

  Exercises copyWith({
    int? id,
    String? title,
    String? file,
    bool? finished,
  }) {
    return Exercises(
      id: id ?? this.id,
      title: title ?? this.title,
      file: file ?? this.file,
      finished: finished ?? this.finished,
    );
  }

  Map<String, dynamic> toMap() {
    try {
      return <String, dynamic>{
        'id': id,
        'title': title,
        'file': file,
        'finished': finished,
      };
    } catch (e) {
      throw e.toString();
    }
  }

  factory Exercises.fromMap(Map<String, dynamic> map) {
    return Exercises(
      id: map['id'] as int,
      title: map['title'] as String,
      file: map['file'] as String,
      finished: map['finished'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercises.fromJson(String source) =>
      Exercises.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Exercises(id: $id, title: $title, file: $file, finished: $finished)';
  }

  @override
  bool operator ==(covariant Exercises other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.file == file &&
        other.finished == finished;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ file.hashCode ^ finished.hashCode;
  }
}
