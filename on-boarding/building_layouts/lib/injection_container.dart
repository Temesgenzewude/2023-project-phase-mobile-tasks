import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/utils/input_converter.dart';
import 'features/todo/data/data_sources/todo_local_data_source.dart';
import 'features/todo/data/data_sources/todo_local_data_source_impl.dart';
import 'features/todo/data/data_sources/todo_remote_data_source.dart';
import 'features/todo/data/data_sources/todo_remote_data_source_impl.dart';
import 'features/todo/data/repositories/todo_repository.dart';
import 'features/todo/domain/repositories/todo_repository.dart';
import 'features/todo/domain/use_cases/add_task_use_case.dart';
import 'features/todo/domain/use_cases/delete_task_use_case.dart';
import 'features/todo/domain/use_cases/update_task_use_case.dart';
import 'features/todo/domain/use_cases/view_all_tasks_use_case.dart';
import 'features/todo/domain/use_cases/view_task_use_case.dart';
import 'features/todo/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Feature- Todo

  // Bloc
  sl.registerFactory(
    () => TodoBloc(
      createTaskUseCase: sl(),
      viewAllTasksUseCase: sl(),
      viewTaskUseCase: sl(),
      updateTaskUseCase: sl(),
      deleteTaskUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(
    () => CreateTask(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ViewAllTask(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ViewTask(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdateTask(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => DeleteTask(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources

  sl.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
