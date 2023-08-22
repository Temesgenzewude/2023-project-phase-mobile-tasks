import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        minLines: 1,
        maxLines: hintText == "Enter description" ? 5 : 1,
        controller: _controller,
        style: TextStyle(
            color: Colors.black, fontSize: 14.sp, fontFamily: "InterSemibold"),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey, fontSize: 14.sp, fontFamily: "InterRegular"),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          fillColor: const Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
