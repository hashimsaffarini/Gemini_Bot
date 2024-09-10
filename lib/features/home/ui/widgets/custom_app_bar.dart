import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemeni_bot/features/home/logic/home_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textAnimation;
  late Animation<Offset> _svgAnimation;
  late Animation<Offset> _imageAnimation;

  @override
  void initState() {
    super.initState();

    animationAppBar();
  }

  void animationAppBar() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _textAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _svgAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _imageAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
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
    return Row(
      children: [
        SlideTransition(
          position: _imageAnimation,
          child: Image.asset(
            'assets/images/memoji.png',
            height: 60.h,
          ),
        ),
        SlideTransition(
          position: _textAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning 👋',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Hashim Saffarini',
                style: GoogleFonts.poppins(
                  color: const Color(0xffA8A8A7),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        SlideTransition(
          position: _svgAnimation,
          child: PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'clear_chat') {
                context.read<HomeCubit>().clearText();
             
              } else if (value == 'settings') {}
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'clear_chat',
                child: ListTile(
                  leading: Icon(Iconsax.trash, color: Colors.red),
                  title: Text(
                    'Clear Chat',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Iconsax.setting, color: Colors.blue),
                  title: Text(
                    'Settings',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
            child: SvgPicture.asset(
              'assets/svgs/Shape.svg',
            ),
          ),
        )
      ],
    );
  }
}
