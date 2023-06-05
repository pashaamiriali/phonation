import 'package:phonation/core/abstract/repository/phonation_repository.dart';
import 'package:phonation/core/entities/level.dart';

class GetAllLevelsUseCase {
  final PhonationRepository repo;

  GetAllLevelsUseCase({required this.repo});

  Future<List<Level>> execute() async {
    return await repo.fetchLevels();
  }
}
