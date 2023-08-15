import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exception.dart';
import 'todo_local_data_source.dart';
import '../models/todo_model.dart';

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences sharedPreferences;
  TodoLocalDataSourceImpl({
    required this.sharedPreferences,
  });

// Retrieves a single task from the local data source based on the provided key.
// Returns a Future that resolves to a TodoModel object.
  @override
  Future<TodoModel> getTask(String key) {
    final jsonString = sharedPreferences.getString(key);
    // If the JSON string is not null,
    //decode it into a TodoModel object and return it.
    // Otherwise, throw a CacheException.
    if (jsonString != null) {
      return Future.value(TodoModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

// Retrieves a list of tasks from the local data
//source based on the provided key.
// Returns a Future that resolves to a List of TodoModel objects.
  @override
  Future<List<TodoModel>> getTasks(String key) {
    final todosJson = sharedPreferences.getStringList(key);
    // If the list of JSON strings is not null, 
    //decode each string into a TodoModel object,
    // and return a list of TodoModel objects.
    // Otherwise, throw a CacheException.
    if (todosJson != null) {
      return Future.value(
        todosJson
            .map((todoJson) => TodoModel.fromJson(json.decode(todoJson)))
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }

  // Caches a single task in the local data source with the provided key.
  // Returns a Future that completes when the task is successfully cached.
  @override
  Future<void> cacheTask(String key, TodoModel todoModel) {
    return sharedPreferences.setString(
      key,
      json.encode(todoModel.toJson()),
    );
  }

// Encode each TodoModel object in the list into a JSON string
//and save the list
// of JSON strings in SharedPreferences with the provided key.
  @override
  Future<void> cacheTasks(String key, List<TodoModel> todoModels) {
    final todosJson = todoModels.map((todoModel) {
      return json.encode(todoModel.toJson());
    }).toList();
    return sharedPreferences.setStringList(key, todosJson);
  }

// Remove the value associated with the provided key
// from SharedPreferences.
  @override
  Future<void> removeTask(String key) {
    return sharedPreferences.remove(key);
  }
}
