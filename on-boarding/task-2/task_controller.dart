import 'task_model.dart';

class TaskController {
  List<TaskModel> tasks = [];
  

  Future<void> addTask(TaskModel task) async {
    tasks.add(task);
    print("Task Added");
  }


  List<TaskModel> getCompletedTasks(){
    List<TaskModel> completedTasks = [];
    for (var task in tasks) {
      if(task.status == "completed"){
        completedTasks.add(task);
      }
    }
    return completedTasks;
  }

  List<TaskModel> getPendingTasks(){
    List<TaskModel> pendingTasks = [];
    for (var task in tasks) {
      if(task.status == "pending"){
        pendingTasks.add(task);
      }
    }
    return pendingTasks;
  }

  Future<void> updateTask(String title, String description, String dueDate,
      String status, int task_id) async {
    tasks[task_id].title = title;
    tasks[task_id].description = description;
    tasks[task_id].dueDate = dueDate;
    tasks[task_id].status = status;
    print("Task Updated");
  }

  Future<void> deleteTask(int task_id) async {
    tasks.removeAt(task_id);
    print("Task Removed");
  }
}
