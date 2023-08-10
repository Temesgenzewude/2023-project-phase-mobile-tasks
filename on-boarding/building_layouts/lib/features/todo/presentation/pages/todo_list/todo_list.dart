import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/todo_list/listview_items/list_view_items.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
          child: SizedBox(
            height: 42.h,
            width: 364.w,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Todo List",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontFamily: "InterRegular")),
                  Icon(Icons.more_vert, color: Colors.black, size: 30.h)
                ]),
          ),
        ),
        SizedBox(height: 20.h),
        Image.asset(
          "assets/images/todo_list.png",
          width: 236.w,
          height: 200.h,
        ),
        SizedBox(height: 20.h),
        Container(
          margin: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Todo List",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: "InterSemiBold"),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: const [
                TaskItem(
                  title: "Task 1",
                  subtitle: "Description 1",
                  leading: "U",
                  trailingColor: Colors.black12,
                ),
                TaskItem(
                  title: "Task 1",
                  subtitle: "Description 1",
                  leading: "U",
                  trailingColor: Colors.black12,
                ),
                TaskItem(
                  title: "Task 1",
                  subtitle: "Description 1",
                  leading: "U",
                  trailingColor: Colors.black12,
                ),
                TaskItem(
                  title: "Task 1",
                  subtitle: "Description 1",
                  leading: "U",
                  trailingColor: Colors.black12,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30.h),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50.h,
            width: 256.w,
            margin: EdgeInsets.only(bottom: 30.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: const Color(0xFFEE6F57)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create Task',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontFamily: "InterBold")),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
