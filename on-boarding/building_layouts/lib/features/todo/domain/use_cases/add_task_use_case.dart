import 'package:building_layouts/core/entities/todo_entity.dart';
import 'package:building_layouts/features/todo/data/models/todo_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';
import '../repositories/todo_repository.dart';
import 'todo_use_case.dart';

class CreateTask implements UseCase<TodoEntity, TodoModel> {
  final TodoRepository repository;
  CreateTask({required this.repository});

  @override
  Future<Either<Failure, TodoEntity>> call(TodoModel todoModel) async {
    return await repository.createTask(todoModel);
  }
}
