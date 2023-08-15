import 'package:building_layouts/core/entities/todo_entity.dart';
import 'package:building_layouts/features/todo/data/models/todo_model.dart';
import 'package:dartz/dartz.dart';

import 'package:building_layouts/core/errors/failure.dart';

abstract class TodoRepository {
  Future<Either<Failure, TodoEntity>> createTask(TodoModel todoModel);
  Future<Either<Failure, TodoEntity>> viewTask(String todoId);
  Future<Either<Failure, List<TodoEntity>>> viewAllTasks();
  Future<Either<Failure, void>> deleteTask(String todoId);
  Future<Either<Failure, TodoEntity>> updateTask(TodoModel todoModel);
}
