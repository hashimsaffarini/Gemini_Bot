import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 36),
        Text(
          'Hello, Ask Me\nAnything...',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Image.asset(
          'assets/images/Frame.png',
        ),
        const SizedBox(height: 20),
        Text(
          'I am a Gemini Bot, I can help you with\nanything you need, just ask me!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xffA8A8A7),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
