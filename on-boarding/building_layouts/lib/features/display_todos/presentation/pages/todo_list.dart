import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/controller/todo_controller.dart';
import '../../../../core/models/todo_model.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    List<TodoModel> todos = TodoController.todos;
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
          // remove default padding of ListView
          // how to remove default padding of ListView in Flutter?

          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.h),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset:
                              const Offset(1, 1), // changes position of shadow
                        ),
                      ]),
                  child: ListTile(
                    onTap: () {
                      updateTodo(context, index);
                    },
                    // leading: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       height: 40.h,
                    //       width: 40.h,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(20.h),
                    //         color: Colors.white,
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.grey.withOpacity(0.1),
                    //             spreadRadius: 1,
                    //             blurRadius: 2,
                    //             offset: const Offset(
                    //                 1, 1), // changes position of shadow
                    //           ),
                    //         ],
                    //       ),
                    //       child: Center(
                    //         child: Text(
                    //           "U",
                    //           style: TextStyle(
                    //               color: Colors.black,
                    //               fontFamily: "InterMedium",
                    //               fontSize: 14.sp),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          todos[index].title,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "InterSemiBold",
                              fontSize: 14.sp),
                        ),
                        Text(
                          "Apr 20,2023",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "InterRegular",
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      todos[index].description,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "InterRegular",
                          fontSize: 12.sp),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
        SizedBox(height: 30.h),
        GestureDetector(
          onTap: () => addTodo(context),
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

  void addTodo(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/add_task') as TodoModel;
    if (!mounted) return;

    if (result != null) {
      setState(() {
        TodoController().addTodo(result);
      });

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
            const SnackBar(content: Text('Task added successfully')));
    }
  }

  void updateTodo(BuildContext context, int index) async {
    final result = await Navigator.pushNamed(
      context,
      '/task_detail',
      arguments: index,
    ) as TodoModel;
    if (!mounted) return;
    if (result != null) {
      setState(() {
        TodoController.todos[index] = result;
      });
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
            const SnackBar(content: Text('Task updated successfully')));
    }
  }
}
