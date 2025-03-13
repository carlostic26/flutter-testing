import 'package:ruta_flutter/features/progress/data/model/progress_model.dart';
import 'package:ruta_flutter/features/progress/domain/repositories/progress_repository.dart';

class GetAllModulesProgressUseCase {
  final ProgressRepository _progressRepository;
  late final String module;

  GetAllModulesProgressUseCase(this._progressRepository);

  Future<List<ProgressModel>> call() async {
    return await _progressRepository.getAllModuleProgress(module);
  }
}
