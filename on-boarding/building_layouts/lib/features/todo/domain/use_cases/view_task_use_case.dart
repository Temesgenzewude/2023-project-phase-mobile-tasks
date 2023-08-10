import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';
import '../repositories/todo_repository.dart';
import 'todo_use_case.dart';

class ViewTask implements UseCase<TaskEntity, String> {
  final TodoRepository repository;
  ViewTask({required this.repository});

  @override
  Future<Either<Failure, TaskEntity>> call(String taskId) async {
    return await repository.viewTask(taskId);
  }
}
