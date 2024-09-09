import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemeni_bot/features/home/ui/home_screen.dart';

class GeminiApp extends StatelessWidget {
  const GeminiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Gemini App',
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white,
            selectionColor: Colors.grey,
            selectionHandleColor: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
