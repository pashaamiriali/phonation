import 'package:phonation/core/usecases/get_pronunciation_practice_for_lesson.dart';
import 'package:phonation/data/repos/fake_phonation_repository_impl.dart';
import 'package:phonation/presentation/provider/pronunciation_practice_provider.dart';

void fetchPronunciationPracticeForLessonService(PronunciationPracticeProvider provider, int lessonId) async {
  provider.initialized = false;
  var uc = GetPronunciationPracticeUseCase(repo: FakePhonationRepositoryIMPL());
  provider.practices = await uc.execute(lessonId);
  provider.initialized = true;
}
