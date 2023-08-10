import 'dart:convert';

import 'package:building_layouts/core/entities/todo_entity.dart';
import 'package:building_layouts/features/todo/data/models/todo_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';

void main() {
  TodoModel tTodoModel = const TodoModel(
      id: "1",
      title: "Task 8",
      description: "complete day 8 task",
      isCompleted: false);

  test("should be a subclass of TodoEntity", () async {
    //assert
    expect(tTodoModel, isA<TodoEntity>());
  });

  // test fromJson
  test("should return valid TodoModel from json", () async {
    // arrange
    final Map<String, dynamic> jsonMap = await jsonDecode(
        readJson("features/todo/helpers/dummy_data/todo_dummy_response.json"));

    // act
    final result = TodoModel.fromJson(jsonMap);

    // assert
    expect(result, equals(tTodoModel));
  });

  // test toJson
  test("should return valid json from TodoModel", () async {
    // act
    final result = tTodoModel.toJson();

    // assert
    final expectedJsonMap = {
      "id": "1",
      "title": "Task 8",
      "description": "complete day 8 task",
      "isCompleted": false
    };
    expect(result, equals(expectedJsonMap));
  });
}
