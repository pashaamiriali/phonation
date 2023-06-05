class Level {
  final int id;
  final String title;

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(id: json['id'], title: json['title']);
  }

  Level({required this.id, required this.title});
}
