import 'package:dartz/dartz.dart';

import '../../../../core/entities/todo_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/todo_repository.dart';
import '../data_sources/todo_local_data_source.dart';
import '../data_sources/todo_remote_data_source.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  final TodoRemoteDataSource remoteDataSource;
  final NetworkInfoImpl networkInfo;
  TodoRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TodoEntity>> createTask(TodoEntity todoEntity) async {
    if (await networkInfo.isConnected) {
      try {
        TodoModel todoModel = TodoModel(
          id: todoEntity.id,
          title: todoEntity.title,
          description: todoEntity.description,
          isCompleted: todoEntity.isCompleted,
        );
        final remoteTask = await remoteDataSource.createTask(todoModel);
        localDataSource.cacheTask(remoteTask.id, remoteTask);
        return Right(remoteTask);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      return Left(ConnectionFailure(message: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> viewTask(String todoId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTask = await remoteDataSource.viewTask(todoId);
        localDataSource.cacheTask(remoteTask.id, remoteTask);
        return Right(remoteTask);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      // get from local data source
      try {
        final localTask = await localDataSource.getTask(todoId);
        return Right(localTask);
      } on CacheException catch (e) {
        return Left(CacheFailure(message: "Cache Error"));
      }
    }
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> viewAllTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTasks = await remoteDataSource.viewAllTasks();
        localDataSource.cacheTasks("todos", remoteTasks);
        return Right(remoteTasks);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      try {
        final localTasks = await localDataSource.getTasks("tasks");
        return Right(localTasks);
      } on CacheException catch (e) {
        return Left(CacheFailure(message: "Cache Error"));
      }
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> updateTask(TodoEntity todoEntity) async {
    TodoModel todoModel = TodoModel(
      id: todoEntity.id,
      title: todoEntity.title,
      description: todoEntity.description,
      isCompleted: todoEntity.isCompleted,
    );
    if (await networkInfo.isConnected) {
      try {
        final remoteTask =
            await remoteDataSource.updateTask(todoModel.id, todoModel);
        localDataSource.cacheTask(remoteTask.id, remoteTask);
        return Right(remoteTask);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      return Left(ConnectionFailure(message: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(String todoId) async {
    if (await networkInfo.isConnected) {
      try {
        remoteDataSource.deleteTask(todoId);
        localDataSource.removeTask(todoId);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "Server Error"));
      }
    } else {
      return Left(ConnectionFailure(message: "No Internet Connection"));
    }
  }
}
