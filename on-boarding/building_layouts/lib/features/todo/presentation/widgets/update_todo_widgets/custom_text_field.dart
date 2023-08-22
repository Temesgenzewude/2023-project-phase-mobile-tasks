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
      margin: EdgeInsets.only(left: 41.w, right: 41.w),
      width: 311.w,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: const Color(0xFFF1EEEE),
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: const Color(0xFFF1EEEE))),
      child: TextField(
        key: const Key("todoDetailPageTodoTileTextField"),
        controller: _controller,
        minLines: 1,
        maxLines: hintText == "Enter description" ? 5 : 1,
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
