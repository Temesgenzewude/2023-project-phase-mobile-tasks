import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';
import '../repositories/todo_repository.dart';
import 'todo_use_case.dart';

class UpdateTask implements UseCase<TaskEntity, TaskEntity> {
  final TodoRepository repository;
  UpdateTask({required this.repository});

  @override
  Future<Either<Failure, TaskEntity>> call(TaskEntity taskEntity) async {
    return await repository.updateTask(taskEntity);
  }
}
