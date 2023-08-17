import 'package:building_layouts/core/entities/todo_entity.dart';
import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class EmptyState extends TodoState {}

class LoadingState extends TodoState {}

class LoadedAllTasksState extends TodoState {
  final List<TodoEntity> todos;

  const LoadedAllTasksState({required this.todos});

  @override
  List<Object> get props => [todos];
}
class LoadedSingleTaskState extends TodoState {
  final TodoEntity todo;

  const LoadedSingleTaskState({required this.todo});

  @override
  List<Object> get props => [todo];
}

class ErrorState extends TodoState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
