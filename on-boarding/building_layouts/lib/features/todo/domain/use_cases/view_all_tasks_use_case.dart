import 'package:dartz/dartz.dart';

import '../../../../core/entities/todo_entity.dart';
import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';
import '../repositories/todo_repository.dart';
import 'todo_use_case.dart';

class ViewAllTask implements UseCase<List<TodoEntity>, void> {
  final TodoRepository repository;
  ViewAllTask({required this.repository});

  @override
  Future<Either<Failure, List<TodoEntity>>> call(void params) async {
    return await repository.viewAllTasks();
  }
}
