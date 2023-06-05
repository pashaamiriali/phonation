import 'package:phonation/core/entities/lesson.dart';
import 'package:phonation/core/usecases/get_lessons_for_level_use_case.dart';
import 'package:phonation/data/repos/fake_phonation_repository_impl.dart';
import 'package:phonation/presentation/provider/lessons_provider.dart';

void fetchLessonsForLevelService(LessonProvider provider, int levelId) async {
  provider.isLoading = true;
  var uc = GetLessonsForLevelsUseCase(repo: FakePhonationRepositoryIMPL());
  List<Lesson> levels = await uc.execute(levelId);
  provider.isLoading = false;
  provider.updateLessons(levels);
}
