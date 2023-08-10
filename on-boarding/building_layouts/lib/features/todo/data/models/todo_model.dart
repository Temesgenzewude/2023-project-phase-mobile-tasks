import 'package:building_layouts/core/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel(
      {required id, required title, required description, required isCompleted})
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






