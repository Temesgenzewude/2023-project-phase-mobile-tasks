import 'package:building_layouts/features/add_todo/presentation/pages/add_task.dart';
import 'package:building_layouts/core/controller/todo_controller.dart';
import 'package:building_layouts/core/models/todo_model.dart';
import 'package:building_layouts/features/onboarding/presentation/pages/onboarding.dart';
import 'package:building_layouts/features/update_todo/presentation/pages/task_detail.dart';
import 'package:building_layouts/features/display_todos/presentation/pages/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

    expect(find.byType(TodoListPage), findsNWidgets(1));
    expect(find.text('Todo List'), findsNWidgets(2));
  });

  testWidgets('Todo List Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TodoListPage(),
      ),
    );

    expect(find.text('Todo List'), findsNWidgets(2));
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.text('Create Task'), findsOneWidget);
  });

  testWidgets('Add Task page test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddTaskPage(),
      ),
    );

    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.text('Add Task'), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
  });
}


