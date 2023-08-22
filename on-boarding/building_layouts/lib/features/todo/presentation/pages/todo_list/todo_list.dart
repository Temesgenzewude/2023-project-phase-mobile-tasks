import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/todo_bloc.dart';
import '../../bloc/todo_event.dart';
import '../../bloc/todo_state.dart';
import '../../widgets/todo_list/todo_list_widgets.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoBloc>(context).add(LoadAllTasksEvent());
  }

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
                  Text("Tasks",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.sp,
                          fontFamily: "InterSemiBold")),
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
                "Tasks List",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: "InterSemiBold"),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const LoadingWidget();
            } else if (state is LoadedAllTasksState) {
              return Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return TaskItem(
                        todoEntity: state.todos[index],
                      );
                    },
                  ),
                ),
              );
            } else if (state is ErrorState) {
              return DisplayErrorMessage(message: state.message);
            } else if (state is EmptyState) {
              return const DisplayEmptyStateMessage();
            } else {
              return const DisplayErrorMessage(
                  message: "Unexpected Error: Unhandled State");
            }
          },
        ),
        SizedBox(height: 30.h),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/add_task');
          },
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
