import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/todo_controller.dart';
import '../models/todo_model.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({super.key});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoId = ModalRoute.of(context)?.settings.arguments as int;
    if (todoId != null) {
      final todo = TodoController.todos[todoId];
      _titleController.text = todo.title;
      _descriptionController.text = todo.description;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(top: 50.h, left: 41.w, right: 41.w),
          child: SizedBox(
            height: 42.h,
            width: 364.w,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: const Color(0xFFEE6F57),
                      size: 30.h,
                    ),
                  ),
                  Text("Task  Detail",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontFamily: "InterRegular")),
                  Icon(Icons.more_vert, color: Colors.black, size: 30.h)
                ]),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                child: Column(children: [
          Image.asset(
            "assets/images/task_detail.png",
            width: 200.h,
            height: 200.h,
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 41.w, right: 41.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontFamily: "InterRegular"),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            margin: EdgeInsets.only(left: 41.w, right: 41.w),
            height: 55.h,
            width: 311.w,
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            decoration: BoxDecoration(
                color: const Color(0xFFF1EEEE),
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: const Color(0xFFF1EEEE))),
            child: TextField(
              controller: _titleController,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: "InterSemibold"),
              decoration: InputDecoration(
                hintText: "Enter task name",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontFamily: "InterRegular"),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFFFFFFF),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 41.w, right: 41.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontFamily: "InterRegular"),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            margin: EdgeInsets.only(left: 41.w, right: 41.w),
            height: 150.h,
            width: 311.w,
            padding: EdgeInsets.only(left: 15.w, right: 30.w, top: 17.h),
            decoration: BoxDecoration(
                color: const Color(0xFFF1EEEE),
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: const Color(0xFFF1EEEE))),
            child: TextField(
              controller: _descriptionController,
              minLines: 1,
              maxLines: 5,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: "InterMedium"),
              decoration: InputDecoration(
                hintText: "Enter description",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontFamily: "InterRegular"),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFFFFFFF),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 41.w, right: 41.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Deadline",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontFamily: "InterRegular"),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            margin: EdgeInsets.only(left: 41.w, right: 41.w),
            height: 55.h,
            width: 311.w,
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            decoration: BoxDecoration(
                color: const Color(0xFFF1EEEE),
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: const Color(0xFFF1EEEE))),
            child: TextField(
              controller: _dueDateController,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: "InterSemiBold"),
              decoration: InputDecoration(
                hintText: "Enter due date",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontFamily: "InterRegular"),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFFFFFFF),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              TodoModel todo = TodoModel(
                title: _titleController.text,
                description: _descriptionController.text,
              );
              _descriptionController.clear();
              _titleController.clear();

              Navigator.pop(
                context,
                todo,
              );
            },
            child: Container(
              height: 50.h,
              width: 180.w,
              margin: EdgeInsets.only(bottom: 30.h, top: 40.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color(0xFFEE6F57)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Update Task',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontFamily: "InterBold")),
                ],
              ),
            ),
          ),
        ]))),
      ]),
    );
  }
}
