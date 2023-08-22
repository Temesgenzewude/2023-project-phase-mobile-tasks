import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.h, left: 41.w, right: 41.w),
      child: SizedBox(
        height: 42.h,
        width: 364.w,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
          Text("Task  Detail",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontFamily: "InterRegular")),
          Icon(Icons.more_vert, color: Colors.black, size: 30.h)
        ]),
      ),
    );
  }
}
