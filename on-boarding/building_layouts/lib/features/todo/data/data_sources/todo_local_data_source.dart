import 'package:building_layouts/features/todo/data/models/todo_model.dart';

abstract class TodoLocalDataSource {
  /// Returns a [TodoModel] from the local cache
  ///
  /// Throws a [CacheException] for all error codes
  Future<TodoModel> getTask(String key);

  /// Returns a list of [TodoModel] from the local cache
  ///
  /// Throws a [CacheException] for all error codes
  Future<List<TodoModel>> getTasks(String key);

  /// Caches a [TodoModel] to the local cache
  ///
  /// Throws a [CacheException] for all error codes
  Future<void> cacheTask(String key, TodoModel todoModel);

  /// Caches a list of [TodoModel] to the local cache
  ///
  /// Throws a [CacheException] for all error codes
  Future<void> cacheTasks(String key, List<TodoModel> todoModels);

  /// Removes a [TodoModel] from the local cache
  ///
  /// Throws a [CacheException] for all error codes
  Future<void> removeTask(String key);
}
