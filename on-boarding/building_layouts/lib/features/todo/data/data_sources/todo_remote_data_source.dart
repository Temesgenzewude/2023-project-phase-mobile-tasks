import '../../../../core/entities/todo_entity.dart';
import '../models/todo_model.dart';

abstract class TodoRemoteDataSource {
  /// Returns a [TodoModel] from the remote server after making a network call to the server to create a task
  ///
  /// Throws a [ServerException] for all error codes
  Future<TodoModel> createTask(TodoModel todoModel);

  /// Returns a [TodoModel] from the remote server after making a network call to the server to view a task
  ///
  /// Throws a [ServerException] for all error codes
  Future<TodoModel> viewTask(String todoId);

  /// Returns a list of [TodoModel] from the remote server after making a network call to the server to view all tasks
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<TodoModel>> viewAllTasks();

  ///Returns a [TodoModel] from the remote server after making a network call to the server to update a task
  ///
  /// Throws a [ServerException] for all error codes
  Future<TodoModel> updateTask(String todoId,TodoModel todoModel);

  /// makes a network call to the server to delete a todo with the given todoId
  ///
  /// Throws a [ServerException] for all error codes
  Future<void> deleteTask(String todoId);

  
}
