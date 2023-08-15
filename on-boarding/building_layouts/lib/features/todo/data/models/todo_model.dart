import 'package:building_layouts/core/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel(
      {required String id,
      required String title,
      required String description,
      required bool isCompleted})
      : super(
            id: id,
            title: title,
            description: description,
            isCompleted: isCompleted);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        isCompleted: json['isCompleted']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isCompleted": isCompleted
    };
  }
}
