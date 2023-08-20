import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String status;
  final String dueDate;

  const TodoEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.dueDate,
      required this.status});

  @override
  List<Object?> get props => [id, title, description, dueDate, status];
}
