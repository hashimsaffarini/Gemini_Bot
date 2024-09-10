import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemeni_bot/features/home/logic/home_cubit.dart';
import 'package:gemeni_bot/gemini_app.dart';

Future<void> main() async {
  //? Ensure that the WidgetsBinding is initialized before calling runApp

  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (context) => HomeCubit(),
    child: const GeminiApp(),
  ));
}
