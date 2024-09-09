import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypingTextForm extends StatefulWidget {
  const TypingTextForm({
    super.key,
  });

  @override
  State<TypingTextForm> createState() => _TypingTextFormState();
}

class _TypingTextFormState extends State<TypingTextForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff3D3D3D),
          hintText: 'Type your message...',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 14.h,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
