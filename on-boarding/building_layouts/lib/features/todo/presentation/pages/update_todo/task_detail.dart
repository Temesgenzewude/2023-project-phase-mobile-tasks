// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:building_layouts/core/entities/todo_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/update_todo_widgets/update_todo_widgets.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({super.key});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final List<String> _status = ["Not Started", "Completed", "In Progress"];
  String _selectedStatus = "";

  @override
  Widget build(BuildContext context) {
    final todoEntity = ModalRoute.of(context)!.settings.arguments as TodoEntity;

    _titleController.text = todoEntity.title;
    _descriptionController.text = todoEntity.description;
    _dueDateController.text = todoEntity.dueDate;
    _selectedStatus = todoEntity.status;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const BuildAppBar(),
        Expanded(
            child: SingleChildScrollView(
                child: Column(children: [
          Image.asset(
            "assets/images/task_detail.png",
            width: 200.h,
            height: 200.h,
          ),
          SizedBox(height: 20.h),
          const Headline(
            text: "Title",
          ),
          SizedBox(height: 8.h),
          CustomTextField(
              controller: _titleController, hintText: "Enter title"),
          SizedBox(height: 15.h),
          const Headline(
            text: "Description",
          ),
          SizedBox(height: 8.h),
          CustomTextField(
              controller: _descriptionController,
              hintText: "Enter description"),
          SizedBox(height: 15.h),
          const Headline(
            text: "Due Date",
          ),
          SizedBox(height: 8.h),
          CustomTextField(
              controller: _dueDateController, hintText: "Enter due date"),
          SizedBox(height: 25.h),
          buildDropdown(),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: Container(
              height: 50.h,
              width: 250.w,
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

  Container buildDropdown() {
    return Container(
      margin: EdgeInsets.only(left: 41.w, right: 41.w),
      width: 311.w,
      // padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Status",
            style: TextStyle(
                color: Colors.black,
                fontSize: 17.sp,
                fontFamily: "InterRegular"),
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
                      offset: const Offset(1, 1), // changes position of shadow
                    ),
                  ],
                  color:  Colors.grey.shade200),
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
                  value: _selectedStatus.isNotEmpty ? _selectedStatus : null,
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
