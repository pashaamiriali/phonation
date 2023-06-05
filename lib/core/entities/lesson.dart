class Lesson {
  final int id;
  final int levelId;
  final String title;

  Lesson(this.id, this.levelId, this.title);

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        json['id'],
        json['levelId'],
        json['title'],
      );
}
