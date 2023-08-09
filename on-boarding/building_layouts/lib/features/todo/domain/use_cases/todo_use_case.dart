import 'package:building_layouts/core/errors/failure.dart';
import 'package:building_layouts/features/todo/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/todo_repository.dart';

abstract class UseCase {}

class CreateTask implements UseCase {
  final TodoRepository repository;
  CreateTask({required this.repository});

  Future<Either<Failure, TaskEntity>> call(TaskEntity taskEntity) async {
    return await repository.createTask(taskEntity);
  }
}

class ViewTask implements UseCase {
  final TodoRepository repository;
  ViewTask({required this.repository});

  Future<Either<Failure, TaskEntity>> call(String taskId) async {
    return await repository.viewTask(taskId);
  }
}

class ViewAllTask implements UseCase {
  final TodoRepository repository;
  ViewAllTask({required this.repository});

  Future<Either<Failure, List<TaskEntity>>> call() async {
    return await repository.viewAllTasks();
  }
}

class UpdateTask implements UseCase {
  final TodoRepository repository;
  UpdateTask({required this.repository});

  Future<Either<Failure, TaskEntity>> call(TaskEntity taskEntity) async {
    return await repository.updateTask(taskEntity);
  }
}

class DeleteTask implements UseCase {
  final TodoRepository repository;
  DeleteTask({required this.repository});

  Future<Either<Failure, void>> call(String taskId) async {
    return await repository.deleteTask(taskId);
  }
}
