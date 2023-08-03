import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Icon(
                    Icons.arrow_back_ios,
                    color: const Color(0xFFEE6F57),
                    size: 30.h,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "UI/UX App Design",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontFamily: "InterRegular"),
              ),
            ],
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  " First I have to animate the logo and prototyping my design. It’s very important. ",
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontFamily: "InterRegular"),
                ),
              ),
            ],
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "April 29, 2023",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: "InterRegular"),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
