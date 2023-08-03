import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFFEE6F57),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 100.h),
          Image.asset('assets/images/onboarding.png',
              height: 480.h, width: 480.h),
          SizedBox(height: 136.h),
          Container(
            height: 50.h,
            width: 256.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: const Color(0xFF0C8CE9)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontFamily: "InterBold")),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
