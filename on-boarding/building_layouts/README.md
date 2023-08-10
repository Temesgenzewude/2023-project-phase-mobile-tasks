![Onboarding Page](assets/images/documentation_images/image-4.png)

![Task List Page](assets/images/documentation_images/image-2.png)

![Create Task Page](assets/images/documentation_images/image.png)

![Update Task Page](assets/images/documentation_images/image-1.png)

# Onboarding Page Test:

```dart

// Test case to verify that tapping the "Get Started" button on the OnboardingPage
  // navigates to the TodoListPage and checks for specific elements on the page.
  testWidgets("Tapping the Get Started button will navigate to TodoListPage",
      (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (_, __) {
            return const MaterialApp(
              home: OnboardingPage(),
            );
          }),
    );

    expect(find.byType(ElevatedButton), findsOneWidget);
    final findsButton = find.byType(ElevatedButton);
    await tester.tap(findsButton);
    await tester.pumpAndSettle();
    // Verifies that the TodoListPage is present exactly once on the screen.
    expect(find.byType(TodoListPage), findsOneWidget);
  });

```

# Task List Page Test:

```dart

// Test case to verify the elements on the TodoListPage.
  testWidgets('Todo List Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (_, __) {
            return const MaterialApp(
              home: TodoListPage(),
            );
          }),
    );

    // Verifies that the text "Todo List" appears twice on the TodoListPage.
    expect(find.text('Todo List'), findsNWidgets(2));

    // // Verifies that there is exactly one GestureDetector widget on the TodoListPage.
    // expect(find.byType(GestureDetector), findsNWidgets(4));

    expect(
        find.byKey(const ValueKey("todoListPageTodoTitle0")), findsOneWidget);
    expect(find.byKey(const ValueKey("todoListPageTodoDeadline0")),
        findsOneWidget);

    // Verifies that the text "Create Task" appears once on the TodoListPage.
    expect(find.text('Create Task'), findsOneWidget);
  });

```

# Update Task Page Test:

```dart


  // Test cases to verify elements on the UpdateTodoPage
  testWidgets('Update Todo Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 840),
        builder: (_, __) {
          return const MaterialApp(
            home: TodoListPage(),
          );
        },
      ),
    );
    // Verify that tapping one of the todo from the todo list page will redirect to task detail page
    await tester.tap(find.byKey(const ValueKey("todoListPageTodoTitle0")));
    await tester.pumpAndSettle();
    // Verify that there is exactly one TaskDetailPage widget
    expect(find.byType(TaskDetailPage), findsOneWidget);
    // Verifies that there are exactly three TextField widgets on the UpdateTodoPage.
    expect(find.byType(TextField), findsNWidgets(3));

    // verify that the TaskDetailPage contains the title of the todo passed from the todo list page
    expect(find.text(TodoController.todos[0].title), findsOneWidget);

    // Verifies that the text "Update Task" appears once on the UpdateTodoPage.
    expect(find.text('Update Task'), findsOneWidget);

    // Verify that "Description" appear once on the UpdateTodoPage
    expect(find.text('Description'), findsOneWidget);
  });
```

# Create Task Page Test:

```dart

 // Test case to verify the elements on the AddTaskPage.
  testWidgets('Add Task page test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 840),
        builder: (_, __) {
          return const MaterialApp(
            home: AddTaskPage(),
          );
        },
      ),
    );

    // Verifies that there are exactly three TextField widgets on the AddTaskPage.
    expect(find.byType(TextField), findsNWidgets(3));

    // Verifies that the text "Add Task" appears once on the AddTaskPage.
    expect(find.text('Add Task'), findsOneWidget);

    // Verify that "Description" appear once on the AddTaskPage
    expect(find.text('Description'), findsOneWidget);
  });

```

# August 9, 2023

Project Setup:

![Project Setup](assets/images/documentation_images/image-3.png)

TodoEntity Implementation:

```dart
class TodoEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  const TodoEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.isCompleted});

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}

```

Implement Models:

```dart
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

// TodoMode Test:
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

   final result = tTodoModel.toJson();


   final expectedJsonMap = {
     "id": "1",
     "title": "Task 8",
     "description": "complete day 8 task",
     "isCompleted": false
   };

   //assert
   expect(result, equals(expectedJsonMap));
 });
}
```
