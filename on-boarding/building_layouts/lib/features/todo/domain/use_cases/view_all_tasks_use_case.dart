import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';
import '../repositories/todo_repository.dart';
import 'todo_use_case.dart';

class ViewAllTask implements UseCase<List<TaskEntity>, void> {
  final TodoRepository repository;
  ViewAllTask({required this.repository});

  @override
  Future<Either<Failure, List<TaskEntity>>> call(void params) async {
    return await repository.viewAllTasks();
  }
}
