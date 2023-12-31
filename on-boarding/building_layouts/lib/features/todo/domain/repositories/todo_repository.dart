import 'package:dartz/dartz.dart';
import '../../../../core/entities/todo_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class TodoRepository {
  Future<Either<Failure, TodoEntity>> createTask(TodoEntity todoEntity);
  Future<Either<Failure, TodoEntity>> viewTask(String todoId);
  Future<Either<Failure, List<TodoEntity>>> viewAllTasks();
  Future<Either<Failure, void>> deleteTask(String todoId);
  Future<Either<Failure, TodoEntity>> updateTask(TodoEntity todoEntity);
}
