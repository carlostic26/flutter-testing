import 'package:ruta_flutter/features/final_exam/domain/repositories/exam_repository.dart';

class GetCorrectAnswers {
  final ExamRepository repository;

  GetCorrectAnswers(this.repository);

  Future<List<String>> call(List<String> questionIds) async {
    return await repository.getCorrectAnswers(questionIds);
  }
}
