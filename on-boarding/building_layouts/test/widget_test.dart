import 'package:building_layouts/features/add_todo/presentation/pages/add_task.dart';
import 'package:building_layouts/core/controller/todo_controller.dart';
import 'package:building_layouts/core/models/todo_model.dart';
import 'package:building_layouts/features/onboarding/presentation/pages/onboarding.dart';
import 'package:building_layouts/features/update_todo/presentation/pages/task_detail.dart';
import 'package:building_layouts/features/display_todos/presentation/pages/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test case to verify that tapping the "Get Started" button on the OnboardingPage
  // navigates to the TodoListPage and checks for specific elements on the page.
  testWidgets("Tapping the Get Started button will navigate to TodoListPage",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnboardingPage(),
      ),
    );
    final findsButton = find.text('Get Started');
    await tester.tap(findsButton);
    await tester.pumpAndSettle();

    // Verifies that the TodoListPage is present exactly once on the screen.
    expect(find.byType(TodoListPage), findsNWidgets(1));

    // Verifies that the text "Todo List" appears twice on the TodoListPage.
    expect(find.text('Todo List'), findsNWidgets(2));
  });

  // Test case to verify the elements on the TodoListPage.
  testWidgets('Todo List Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TodoListPage(),
      ),
    );

    // Verifies that the text "Todo List" appears twice on the TodoListPage.
    expect(find.text('Todo List'), findsNWidgets(2));

    // Verifies that there is exactly one GestureDetector widget on the TodoListPage.
    expect(find.byType(GestureDetector), findsOneWidget);

    // Verifies that the text "Create Task" appears once on the TodoListPage.
    expect(find.text('Create Task'), findsOneWidget);
  });

  // Test case to verify the elements on the AddTaskPage.
  testWidgets('Add Task page test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddTaskPage(),
      ),
    );

    // Verifies that there are exactly three TextField widgets on the AddTaskPage.
    expect(find.byType(TextField), findsNWidgets(3));

    // Verifies that the text "Add Task" appears once on the AddTaskPage.
    expect(find.text('Add Task'), findsOneWidget);

    // Verifies that the texts "Title" and "Description" appear once on the AddTaskPage each.
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
  });
}


