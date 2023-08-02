import 'task_controller.dart';
import 'task_model.dart';
import 'dart:io';

class Driver {
  void bootProcess() {
    TaskController taskController = TaskController();
    while (true) {
      print("Select the action to execute");
      print("1: To Create a New Task  2: To Update Task 3: To Delete Task ");
      print("4: To See All Tasks 5: To See Completed Tasks 6: To See Pending Tasks");
      print("0: To Exit");

      String? action = stdin.readLineSync();
      if (action != null) {
        switch (action) {
          case "1":
            // create task
            createTask(taskController);
            break;
          case "2":
            // update task
            updateTask(taskController);
            break;
          case "3":
            // delete task
            deleteTask(taskController);
            break;
          case "4":
            // see all tasks
            seeAllTasks(taskController);
            break;
          case "5":
            // see completed tasks
            seeCompletedTasks(taskController);
            break;
          case "6":
            // see pending tasks
            seePendingTasks(taskController);
            break;
          case "0":
            print("Goodbye!");
            return;
          default:
            print("Invalid action. Please select a valid action.");
            break;
        }
      } else {
        print("Please select your action");
      }
    }
  }

   void createTask(TaskController taskController) {
    print("Enter Task Title");
    String? title = stdin.readLineSync();
    print("Enter Task Description");
    String? description = stdin.readLineSync();
    print("Enter Task Due Date");
    String? dueDate = stdin.readLineSync();
    print("Enter Task Status");
    String? status = stdin.readLineSync();

    TaskModel task = TaskModel(
      title: title ?? "No Task Title provided",
      description: description ?? "No Task description provided",
      dueDate: dueDate ?? "No Due date provided",
      status: status ?? "No status provided",
    );

    taskController.addTask(task);
  }

  void updateTask(TaskController taskController) {
    if (taskController.tasks.isEmpty) {
      print("No Task to Update. Please first create a task!");
      return;
    }

    print("Please select the task id to update (0 to ${taskController.tasks.length - 1}):");
    String? task_id = stdin.readLineSync();
    if (task_id != null) {
      int taskId = int.tryParse(task_id) ?? -1;
      if (taskId >= 0 && taskId < taskController.tasks.length) {
        print("Enter Task Title");
        String? title = stdin.readLineSync();
        print("Enter Task Description");
        String? description = stdin.readLineSync();
        print("Enter Task Due Date");
        String? dueDate = stdin.readLineSync();
        print("Enter Task Status");
        String? status = stdin.readLineSync();

        taskController.updateTask(
          title ?? "No Task Title provided",
          description ?? "No Task description provided",
          dueDate ?? "No Due date provided",
          status ?? "No status provided",
          taskId,
        );
      } else {
        print("Invalid task id. Please select a valid task id.");
      }
    } else {
      print("Please select the task id.");
    }
  }

  void deleteTask(TaskController taskController) {
    if (taskController.tasks.isEmpty) {
      print("No Task to Delete. Please first create a task!");
      return;
    }

    print("Please select the task id to delete (0 to ${taskController.tasks.length - 1}):");
    String? task_id = stdin.readLineSync();

    if (task_id != null) {
      int taskId = int.tryParse(task_id) ?? -1;
      if (taskId >= 0 && taskId < taskController.tasks.length) {
        taskController.deleteTask(taskId);
      } else {
        print("Invalid task id. Please select a valid task id.");
      }
    } else {
      print("Please select the task id.");
    }
  }

  void seeAllTasks(TaskController taskController) {
    if (taskController.tasks.isEmpty) {
      print("No Tasks Available. Please first create some tasks!");
    } else {
      print("All Tasks Are:");
      print("");
      for (var task in taskController.tasks) {
        task.describeTask();
      }
    }
  }

  void seeCompletedTasks(TaskController taskController) {
    List<TaskModel> completedTasks = taskController.getCompletedTasks();
    if (completedTasks.isEmpty) {
      print("No Completed Tasks Yet. Please mark the tasks that are done as completed.");
    } else {
      print("All Completed Tasks Are:");
      print("");
      for (var task in completedTasks) {
        task.describeTask();
      }
    }
  }

  void seePendingTasks(TaskController taskController) {
    List<TaskModel> pendingTasks = taskController.getPendingTasks();
    if (pendingTasks.isEmpty) {
      print("No Pending Tasks Yet. Please mark the tasks that are pending as pending.");
    } else {
      print("All Pending Tasks Are:");
      print("");
      for (var task in pendingTasks) {
        task.describeTask();
      }
    }
  }
}
