import 'task_controller.dart';
import 'task_model.dart';
import 'dart:io';

class Driver {
  Driver();

  void bootProcess() {
    TaskController taskController = TaskController();
    while (true) {
      print("Select the action to execute");
      print("1: To Create a New Task  2: To Update Task 3: To Delete Task ");
      print(
          "4: To See All Tasks 5: To See Completed Tasks 6: To See Pending Tasks");
      print("0: To Exit");

      String? action = stdin.readLineSync();
      if (action != null) {
        if (action == "1") {
          // create task
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
              status: status ?? "No status provided");

          taskController.addTask(task);
        } else if (action == "2") {
          // update task
          if (taskController.tasks.length > 0) {
            print(
                "Please select the task id to update: from 0 to ${taskController.tasks.length}");
            String? task_id = stdin.readLineSync();
            if (task_id != null) {
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
                  int.parse(task_id));
            } else {
              print("Please select the task id");
              continue;
            }
          } else {
            print("No Task to Update. Please firs create the task!");
            continue;
          }
        } else if (action == "3") {
          // delete task
          if (taskController.tasks.length > 0) {
            print(
                "Please select the task id to delete: from 0 to ${taskController.tasks.length}");
            String? task_id = stdin.readLineSync();

            if (task_id != null) {
              taskController.deleteTask(int.parse(task_id));
            }
          } else {
            print("No Task to Delete. Please firs create the task!");
            continue;
          }
        } else if (action == "4") {
          // see all tasks
          if (taskController.tasks.length > 0) {
            print("All Tasks Are:");
            print("");
            for (var task in taskController.tasks) {
              task.describeTask();
            }
          } else {
            print("No Tasks Available. Please first create some tasks!");
            continue;
          }
        } else if (action == "5") {
          // see completed tasks
          if (taskController.getCompletedTasks().length > 0) {
            print("All Completed Tasks Are:");
            print("");
            for (var task in taskController.getCompletedTasks()) {
              task.describeTask();
            }
          } else {
            print(
                "No Completed Tasks Yet. Please mark the tasks that are done as completed");
            continue;
          }
        } else if (action == "6") {
          // see pending tasks
          if (taskController.getPendingTasks().length > 0) {
            print("All Pending Tasks Are:");
            print("");
            for (var task in taskController.getPendingTasks()) {
              task.describeTask();
            }
          } else {
            print(
                "No Pending Tasks Yet. Please mark the tasks that are pending as pending");
            continue;
          }
        } else if (action == "0") {
          print("Good bye!");
          break;
        }
      } else {
        print("Please select your action");
        continue;
      }
    }
  }
}
