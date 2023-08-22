import 'package:building_layouts/core/entities/todo_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.todoEntity});
  final TodoEntity todoEntity;

  @override
  Widget build(BuildContext context) {
    print(todoEntity.status); 
    return Container(
      margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.h),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ]),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/task_detail", arguments: todoEntity);
        },
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.h),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  todoEntity.title[0],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "InterMedium",
                      fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              todoEntity.title,
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
          todoEntity.description,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "InterSemiBold",
              fontSize: 14.sp),
        ),
        trailing: Container(
          color: todoEntity.status == "Completed"
              ? Colors.green
              : todoEntity.status == "In Progress"
                  ? Colors.yellow
                  : Colors.red,
          height: 50.h,
          width: 4.w,
        ),
      ),
    );
  }
}
