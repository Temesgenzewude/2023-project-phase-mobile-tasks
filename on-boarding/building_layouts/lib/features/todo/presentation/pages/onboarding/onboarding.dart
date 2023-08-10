
import 'package:building_layouts/features/todo/presentation/pages/todo_list/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEE6F57),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Align content vertically
          children: <Widget>[
            SizedBox(height: 50.h),
            Image.asset('assets/images/onboarding.png', height: 400.h, width: 400.h),
            SizedBox(height: 20.h), // Adjust spacing
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoListPage(),
                  ),
                );
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../display_todos/presentation/pages/todo_list.dart';

// class OnboardingPage extends StatelessWidget {
//   const OnboardingPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         color: const Color(0xFFEE6F57),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//           SizedBox(height: 100.h),
//           Image.asset('assets/images/onboarding.png',
//               height: 480.h, width: 480.h),
//           SizedBox(height: 136.h),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const TodoListPage(),
//                   ));
//             },
//             child: Container(
//               height: 50.h,
//               width: 256.w,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5.r),
//                   color: const Color(0xFF0C8CE9)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Get Started',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 19.sp,
//                           fontFamily: "InterBold")),
//                 ],
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
