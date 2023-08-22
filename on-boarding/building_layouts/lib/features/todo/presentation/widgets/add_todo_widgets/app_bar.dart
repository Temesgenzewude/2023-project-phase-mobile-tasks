import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container buildAppBar(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
    child: SizedBox(
      height: 42.h,
      width: 364.w,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
  );
}
