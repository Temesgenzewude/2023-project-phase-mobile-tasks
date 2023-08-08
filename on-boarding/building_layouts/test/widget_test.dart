import 'package:building_layouts/features/add_todo/presentation/pages/add_task.dart';
import 'package:building_layouts/core/controller/todo_controller.dart';

import 'package:building_layouts/features/onboarding/presentation/pages/onboarding.dart';
import 'package:building_layouts/features/update_todo/presentation/pages/task_detail.dart';
import 'package:building_layouts/features/display_todos/presentation/pages/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

  
}
