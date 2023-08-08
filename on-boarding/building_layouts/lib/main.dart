
import 'package:building_layouts/features/display_todos/presentation/pages/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/add_todo/presentation/pages/add_task.dart';
import 'features/onboarding/presentation/pages/onboarding.dart';
import 'features/update_todo/presentation/pages/task_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const OnboardingPage(),
            "/home": (context) => const TodoListPage(),
            "/add_task": (context) => const AddTaskPage(),
            "/task_detail": (context) => const TaskDetailPage(),
            
          },
          title: 'Task Manager',
        );
      },
    );
  }
}
