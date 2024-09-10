import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemeni_bot/features/home/logic/home_cubit.dart';

class TypingTextForm extends StatefulWidget {
  const TypingTextForm({
    super.key,
  });

  @override
  State<TypingTextForm> createState() => _TypingTextFormState();
}

class _TypingTextFormState extends State<TypingTextForm> {
  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<HomeCubit>().formKey,
      child: TextFormField(
        controller: context.read<HomeCubit>().textEditingController,
        onChanged: (value) {
          if (context.read<HomeCubit>().messagesList.isEmpty) {
            setState(() {
              isTyping = value.isNotEmpty;
            });

            context.read<HomeCubit>().changeTypingState(value.isNotEmpty);
          }
        },
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
