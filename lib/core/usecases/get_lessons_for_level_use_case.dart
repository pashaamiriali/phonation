import 'package:phonation/core/abstract/repository/phonation_repository.dart';
import 'package:phonation/core/entities/lesson.dart';

class GetLessonsForLevelsUseCase {
  final PhonationRepository repo;

  GetLessonsForLevelsUseCase({required this.repo});

  Future<List<Lesson>> execute(int levelId) async {
    return await repo.fetchLessonsForLevel(levelId);
  }
}
