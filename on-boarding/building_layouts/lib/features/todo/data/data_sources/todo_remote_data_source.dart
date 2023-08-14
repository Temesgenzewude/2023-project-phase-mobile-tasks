import '../../../../core/entities/todo_entity.dart';
import '../../domain/entities/task_entity.dart';
import '../models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<TodoModel> createTask(TodoEntity todoEntity);
  Future<TodoModel> viewTask(String todoId);
  Future<List<TodoModel>> viewAllTasks();
  Future<void> deleteTask(String todoId);
  Future<TodoModel> updateTask(TodoEntity todoEntity);
}
