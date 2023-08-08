import '../models/todo_model.dart';

class TodoController {
  static List<TodoModel> todos = [
    TodoModel(
      title: 'UI/UX App',
      description: "UI/UX App Design",
    ),
    TodoModel(
      title: 'Implement UI',
      description: "Implement UI/UX App Design",
    ),
    TodoModel(
      title: 'Integrate API',
      description: "Integrate API with UI/UX App Design",
    ),
    TodoModel(
      title: 'Test App',
      description: "Test UI/UX App Design",
    ),
    TodoModel(
      title: 'Write Documentation',
      description: "Write Documentation for UI/UX App Design",
    ),
  ];

  void addTodo(TodoModel todo) {

  
  
    
    todos.add(todo);
  }

  void updateTodo(int todoId, TodoModel newTodo) {
    if (todos.isEmpty) {
      
      return;
    }

    todos[todoId] = newTodo;
  }

  void delete(TodoModel todo) {
    todos.remove(todo);
  }
}
