import 'package:phonation/core/entities/lesson.dart';
import 'package:phonation/core/entities/level.dart';
import 'package:phonation/core/entities/pronunciation_practice.dart';

abstract class PhonationRepository {
  Future<List<Level>> fetchLevels();

  Future<List<Lesson>> fetchLessonsForLevel(int levelId);

  Future<List<PronunciationPractice>> fetchPronunciationPractice(int lessonId);
}
