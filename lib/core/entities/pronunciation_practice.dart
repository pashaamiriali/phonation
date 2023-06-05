class PronunciationPractice {
  final int id;
  final int lessonId;
  final String transcript;

  PronunciationPractice(
      this.id, this.lessonId, this.transcript);

  factory PronunciationPractice.fromJson(Map<String, dynamic> json) =>
      PronunciationPractice(
        json['id'],
        json['lessonId'],
        json['transcript'],
      );
}
