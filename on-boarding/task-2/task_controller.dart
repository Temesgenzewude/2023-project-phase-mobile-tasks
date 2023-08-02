import 'task_model.dart';

class TaskController {
  List<TaskModel> tasks = [];
  

  void addTask(TaskModel task){
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

  void updateTask(String title, String description, String dueDate,
      String status, int task_id)  {
    tasks[task_id].title = title;
    tasks[task_id].description = description;
    tasks[task_id].dueDate = dueDate;
    tasks[task_id].status = status;
    print("Task Updated");
  }

  void deleteTask(int task_id)  {
    tasks.removeAt(task_id);
    print("Task Removed");
  }
}
