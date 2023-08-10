import 'package:dartz/dartz.dart';

import 'package:building_layouts/core/errors/failure.dart';
import 'package:building_layouts/features/todo/domain/entities/task_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity task);
  Future<Either<Failure, TaskEntity>> viewTask(String taskId);
  Future<Either<Failure, List<TaskEntity>>> viewAllTasks();
  Future<Either<Failure, void>> deleteTask(String taskId);
  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity task);
}
