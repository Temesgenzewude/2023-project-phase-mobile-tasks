import 'package:building_layouts/core/entities/todo_entity.dart';
import 'package:equatable/equatable.dart';

class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadAllTasksEvent extends TodoEvent {}

class CreateTaskEvent extends TodoEvent {
  final TodoEntity task;

  const CreateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class GetSingleTaskEvent extends TodoEvent {
  final String taskId;

  const GetSingleTaskEvent({required this.taskId});

  @override
  List<Object> get props => [taskId];
}

class UpdateTaskEvent extends TodoEvent {
  final TodoEntity task;

  const UpdateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTaskEvent extends TodoEvent {
  final String taskId;

  const DeleteTaskEvent({required this.taskId});

  @override
  List<Object> get props => [taskId];
}
