import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemeni_bot/features/home/logic/home_cubit.dart';
import 'package:gemeni_bot/features/home/ui/widgets/custom_app_bar.dart';
import 'package:gemeni_bot/features/home/ui/widgets/home_screen_actions.dart';
import 'package:gemeni_bot/features/home/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff000000),
              Color(0xFF16305C),
            ],
            stops: [.2, 2],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(right: 18.w, left: 18.w),
            child: Column(
              children: [
                const CustomAppBar(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: context.read<HomeCubit>().isTyping ? 0 : 1,
                            child: const HomeScreenBody(),
                          );
                        },
                      ),
                      const HomeScreenActions(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
