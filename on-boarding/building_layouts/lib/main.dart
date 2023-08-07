
import 'package:building_layouts/todo_list/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_task/add_task.dart';
import 'onboarding/onboarding.dart';
import 'task_detail/task_detail.dart';

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
