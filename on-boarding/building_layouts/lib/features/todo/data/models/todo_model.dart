import 'package:building_layouts/core/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel(
      {required String id,
      required String title,
      required String description,
      required String status,
      required String dueDate})
      : super(
            id: id,
            title: title,
            description: description,
            status: status,
            dueDate: dueDate);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      dueDate: json['dueDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "status": status,
      "dueDate": dueDate
    };
  }
}
