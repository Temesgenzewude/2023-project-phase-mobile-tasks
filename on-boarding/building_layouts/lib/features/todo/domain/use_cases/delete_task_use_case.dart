import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/todo_repository.dart';
import 'todo_use_case.dart';

class DeleteTask implements UseCase<void, String> {
  final TodoRepository repository;
  DeleteTask({required this.repository});

  @override
  Future<Either<Failure, void>> call(String taskId) async {
    return await repository.deleteTask(taskId);
  }
}
