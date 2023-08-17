// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/input_converter.dart';
import '../../domain/use_cases/add_task_use_case.dart';
import '../../domain/use_cases/delete_task_use_case.dart';
import '../../domain/use_cases/update_task_use_case.dart';
import '../../domain/use_cases/view_all_tasks_use_case.dart';
import '../../domain/use_cases/view_task_use_case.dart';
import 'todo_event.dart';
import 'todo_state.dart';

const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid input - the number must be a positive integer or zero';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String DATA_BASE_FAILURE_MESSAGE = "Database Failure";
const String LOCATION_FAILURE_MESSAGE = "Location Failure";
const String CONNECTION_FAILURE_MESSAGE = "Connection Failure";
const String PERMISSION_FAILURE_MESSAGE = "Permission Failure";

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CreateTask createTaskUseCase;
  final ViewAllTask viewAllTasksUseCase;
  final ViewTask viewTaskUseCase;
  final UpdateTask updateTaskUseCase;
  final DeleteTask deleteTaskUseCase;
  TodoBloc({
    required this.createTaskUseCase,
    required this.viewAllTasksUseCase,
    required this.viewTaskUseCase,
    required this.updateTaskUseCase,
    required this.deleteTaskUseCase,
  }) : super(EmptyState()) {
    on<CreateTaskEvent>(_onCreateTaskEvent);
    on<LoadAllTasksEvent>(_onLoadAllTasksEvent);
    on<GetSingleTaskEvent>(_onGetSingleTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
    on<DeleteTaskEvent>(_onDeleteTaskEvent);
  }

  Future<void> _onCreateTaskEvent(
    CreateTaskEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingState());
    final result = await createTaskUseCase(event.task);
    result.fold(
      (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
      (todo) => emit(LoadedSingleTaskState(todo: todo)),
    );
  }

  Future<void> _onLoadAllTasksEvent(
    LoadAllTasksEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingState());
    final result = await viewAllTasksUseCase(null);
    result.fold(
      (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
      (todos) => emit(LoadedAllTasksState(todos: todos)),
    );
  }

  Future<void> _onGetSingleTaskEvent(
    GetSingleTaskEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingState());
    final result = await viewTaskUseCase(event.taskId);
    result.fold(
      (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
      (todo) => emit(LoadedSingleTaskState(todo: todo)),
    );
  }

  Future<void> _onUpdateTaskEvent(
    UpdateTaskEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingState());
    final result = await updateTaskUseCase(event.task);
    result.fold(
      (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
      (todo) => emit(LoadedSingleTaskState(todo: todo)),
    );
  }

  Future<void> _onDeleteTaskEvent(
    DeleteTaskEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(LoadingState());
    final result = await deleteTaskUseCase(event.taskId);
    result.fold(
      (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
      (_) => emit(EmptyState()),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case InvalidInputFailure:
        return INVALID_INPUT_FAILURE_MESSAGE;

      case ConnectionFailure:
        return CONNECTION_FAILURE_MESSAGE;
      case DatabaseFailure:
        return DATA_BASE_FAILURE_MESSAGE;
      case LocationFailure:
        return LOCATION_FAILURE_MESSAGE;
      case PermissionFailure:
        return PERMISSION_FAILURE_MESSAGE;

      default:
        return 'Unexpected error';
    }
  }
}
