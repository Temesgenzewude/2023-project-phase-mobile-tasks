![Onboarding Page](image-4.png)

![Task List Page](image-2.png)

![Create Task Page](image.png)

![Update Task Page](image-1.png)

# Onboarding Page Test:

```dart

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

```

# Task List Page Test:

```dart

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

```

# Create Task Page Test:

```dart

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

```
