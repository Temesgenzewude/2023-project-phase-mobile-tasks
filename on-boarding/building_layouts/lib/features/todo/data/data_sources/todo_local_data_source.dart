import 'package:building_layouts/features/todo/data/models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<TodoModel> getTask(String key);
  Future<List<TodoModel>> getTasks(String key);
  Future<void> cacheTask(String key, TodoModel todoModel);
  Future<void> cacheTasks(String key, List<TodoModel> todoModels);
  Future<void> removeTask(String key);
}
