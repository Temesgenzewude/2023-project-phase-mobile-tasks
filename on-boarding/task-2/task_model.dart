class TaskModel {
  String title;
  String description;
  String dueDate;
  String status;

  TaskModel(
      {required this.title,
      required this.description,
      required this.dueDate,
      required this.status});

  void describeTask() {
    print("Task Detail");
    print(
        "Title: $title  Description: $description  Due Date: $dueDate  Status: $status ");

   
    print("");
  }
}
