import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenBodyWithoutMessages extends StatefulWidget {
  const HomeScreenBodyWithoutMessages({super.key});

  @override
  _HomeScreenBodyWithoutMessagesState createState() =>
      _HomeScreenBodyWithoutMessagesState();
}

class _HomeScreenBodyWithoutMessagesState
    extends State<HomeScreenBodyWithoutMessages>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textAnimation;
  late Animation<Offset> _imageAnimation;
  late Animation<Offset> _subTextAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    _textAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _imageAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _subTextAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 36),
        SlideTransition(
          position: _textAnimation,
          child: Text(
            'Hello, Ask Me\nAnything...',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        SlideTransition(
          position: _imageAnimation,
          child: Image.asset(
            'assets/images/Frame.png',
          ),
        ),
        const SizedBox(height: 20),
        SlideTransition(
          position: _subTextAnimation,
          child: Text(
            'I am a Gemini Bot, I can help you with\nanything you need, just ask me!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xffA8A8A7),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
