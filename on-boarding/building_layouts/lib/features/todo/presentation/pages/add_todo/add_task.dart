// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/add_todo_widgets/add_todo_widgets.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();

  final List<String> _status = ["Not Started", "Completed", "In Progress"];
  String _selectedStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        buildAppBar(context),
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
            const Headline(
              text: "Title",
            ),
            SizedBox(height: 7.h),
            CustomTextField(
                controller: _titleController, hintText: "Enter title"),
            SizedBox(height: 15.h),
            const Headline(
              text: "Due Date",
            ),
            SizedBox(height: 7.h),
            CustomTextField(
                controller: _dueDateController, hintText: "Enter due date"),

            SizedBox(height: 25.h),
            const Headline(
              text: "Description",
            ),
            SizedBox(height: 7.h),
            CustomTextField(
                controller: _descriptionController,
                hintText: "Enter description"),

            // dropdown for task status: pending, in progress, completed

            SizedBox(height: 25.h),
            buildDropdown(),

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

  Container buildDropdown() {
    return Container(
            margin: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Status",
                  style: TextStyle(
                      color: const Color(0xFFEE6F57),
                      fontSize: 16.sp,
                      fontFamily: "InterSemiBold"),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                1, 1), // changes position of shadow
                          ),
                        ],
                        color: const Color(0xFFFFFFFF)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: AlignmentDirectional.center,
                        hint: Text(
                          "Select task status",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                              fontFamily: "InterRegular"),
                        ),
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Color(0xFFEE6F57)),
                        iconSize: 30.h,
                        // isExpanded: true,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: "InterMedium"),
                        value: _selectedStatus.isNotEmpty
                            ? _selectedStatus
                            : null,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedStatus = newValue ?? "";
                          });
                        },
                        items: _status.map((status) {
                          return DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: status,
                            child: Text(status,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: "InterRegular")),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
