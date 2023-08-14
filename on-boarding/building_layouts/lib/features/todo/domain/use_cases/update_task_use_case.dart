import 'package:dartz/dartz.dart';

import '../../../../core/entities/todo_entity.dart';
import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';
import '../repositories/todo_repository.dart';
import 'todo_use_case.dart';

class UpdateTask implements UseCase<TodoEntity, TodoEntity> {
  final TodoRepository repository;
  UpdateTask({required this.repository});

  @override
  Future<Either<Failure, TodoEntity>> call(TodoEntity todoEntity) async {
    return await repository.updateTask(todoEntity);
  }
}
