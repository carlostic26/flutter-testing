import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/score/data/repository/score_repository_impl.dart';
import 'package:ruta_flutter/features/score/domain/repository/score_repository.dart';
import 'package:ruta_flutter/features/score/domain/use_cases/crud_score_use_cases.dart';

final scoreRepositoryProvider = Provider<ScoreRepository>((ref) {
  return ScoreRepositoryImpl();
});

final scoreUseCasesProvider = Provider<ScoreUseCases>((ref) {
  final scoreRepository = ref.read(scoreRepositoryProvider);
  return ScoreUseCases(scoreRepository);
});
