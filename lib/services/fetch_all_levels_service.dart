import 'package:phonation/core/entities/level.dart';
import 'package:phonation/core/usecases/get_all_levels_use_case.dart';
import 'package:phonation/data/repos/fake_phonation_repository_impl.dart';
import 'package:phonation/presentation/provider/home_provider.dart';

void fetchAllLevelsService(HomeProvider provider) async {
  provider.isLoading = true;
  var uc = GetAllLevelsUseCase(repo: FakePhonationRepositoryIMPL());
  List<Level> levels = await uc.execute();
  provider.isLoading = false;
  provider.updateLevels(levels);
}
