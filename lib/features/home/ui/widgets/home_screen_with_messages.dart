import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemeni_bot/features/home/data/message_model.dart';
import 'package:gemeni_bot/features/home/logic/home_cubit.dart';

class HomeScreenBodyWithMessages extends StatelessWidget {
  final List<MessageModel> messages;

  const HomeScreenBodyWithMessages({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      controller: context.read<HomeCubit>().scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final isUserMessage = message.sender == "user";

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Align(
            alignment:
                isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 0.75.sw, // Limit the width of the message bubble
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: isUserMessage
                      ? const Color(0xFF4F8EE5)
                      : const Color(0xFF3D3D3D),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.r),
                    topRight: Radius.circular(18.r),
                    bottomLeft: isUserMessage
                        ? Radius.circular(18.r)
                        : const Radius.circular(0),
                    bottomRight: isUserMessage
                        ? const Radius.circular(0)
                        : Radius.circular(18.r),
                  ),
                ),
                padding: EdgeInsets.all(12.h),
                child: Text(
                  message.message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
