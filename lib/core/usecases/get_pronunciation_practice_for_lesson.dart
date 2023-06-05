import 'package:phonation/core/abstract/repository/phonation_repository.dart';
import 'package:phonation/core/entities/pronunciation_practice.dart';

class GetPronunciationPracticeUseCase {
  final PhonationRepository repo;

  GetPronunciationPracticeUseCase({required this.repo});

  Future<List<PronunciationPractice>> execute(int lessonId) async {
    return await repo.fetchPronunciationPractice(lessonId);
  }
}
