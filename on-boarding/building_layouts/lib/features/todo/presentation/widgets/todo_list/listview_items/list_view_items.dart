import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailingColor,
  });
  final String leading;
  final String title;
  final String subtitle;
  final Color trailingColor;

  @override
  Widget build(BuildContext context) {
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
                  leading,
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
              title,
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
          subtitle,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "InterSemiBold",
              fontSize: 14.sp),
        ),
        trailing: Container(
          color: trailingColor,
          height: 50.h,
          width: 4.w,
        ),
      ),
    );
  }
}
