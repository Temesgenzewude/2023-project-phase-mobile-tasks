import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayEmptyStateMessage extends StatelessWidget {
  const DisplayEmptyStateMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "No Tasks",
              style: TextStyle(color: Colors.black26),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue.shade400),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.h),
                  ),
                ),
              ),
              child: SizedBox(
                width: 200.w,
                height: 60.h,
                child: Text(
                  "Create Task",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.sp,
                      fontFamily: "InterBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
