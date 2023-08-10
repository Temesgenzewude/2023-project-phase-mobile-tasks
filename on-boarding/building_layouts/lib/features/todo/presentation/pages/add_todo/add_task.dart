import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
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
                  Icon(Icons.more_vert, color: Colors.black, size: 30.h)
                ]),
          ),
        ),
        SizedBox(height: 10.h),
        Text("Create new task",
            style: TextStyle(
                color: Colors.black, fontSize: 20.sp, fontFamily: "InterBold")),
        SizedBox(height: 30.h),
        Divider(
          color: Colors.grey.withOpacity(0.5),
          height: 0.h,
          thickness: 1.h,
        ),

        // Add Task Form

        SizedBox(height: 30.h),

        Expanded(
            child: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Main task name",
                    style: TextStyle(
                        color: const Color(0xFFEE6F57),
                        fontSize: 16.sp,
                        fontFamily: "InterSemiBold"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.h),
            Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              height: 70.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(1, 1), // changes position of shadow
                    ),
                  ],
                  color: const Color(0xFFFFFFFF)),
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
            Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Due date",
                    style: TextStyle(
                        color: const Color(0xFFEE6F57),
                        fontSize: 16.sp,
                        fontFamily: "InterSemiBold"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.h),
            Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              height: 70.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(1, 1), // changes position of shadow
                    ),
                  ],
                  color: const Color(0xFFFFFFFF)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300.w,
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
                  Icon(Icons.calendar_today_outlined,
                      color: const Color(0xFFEE6F57), size: 30.h)
                ],
              ),
            ),
            SizedBox(height: 25.h),
            Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                        color: const Color(0xFFEE6F57),
                        fontSize: 16.sp,
                        fontFamily: "InterSemiBold"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.h),
            Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(1, 1), // changes position of shadow
                    ),
                  ],
                  color: const Color(0xFFFFFFFF)),
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
            GestureDetector(
              onTap: () {
                // TodoModel todo = TodoModel(
                //   title: _titleController.text,
                //   description: _descriptionController.text,
                // );
                // _descriptionController.clear();
                // _titleController.clear();

                // Navigator.pop(context, todo);
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
                    Text('Add Task',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.sp,
                            fontFamily: "InterBold")),
                  ],
                ),
              ),
            ),
          ]),
        )),
      ]),
    );
  }
}
