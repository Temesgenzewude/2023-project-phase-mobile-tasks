import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime dueDate;

  const TaskEntity(
      {required this.id,
      required this.title,
      required this.description,
      this.isCompleted = false,
      required this.dueDate});

  @override
  List<Object> get props => [id, title, description, isCompleted, dueDate];
}
