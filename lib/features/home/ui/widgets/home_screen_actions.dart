import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemeni_bot/features/home/ui/widgets/typing_text_form.dart';

class HomeScreenActions extends StatelessWidget {
  const HomeScreenActions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: const Color(0xff3D3D3D),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: SvgPicture.asset(
              'assets/svgs/micro.svg',
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Flexible(
            child: TypingTextForm(),
          ),
          const SizedBox(width: 10),
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: InkWell(
              child: SvgPicture.asset(
                'assets/svgs/send.svg',
                fit: BoxFit.scaleDown,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
