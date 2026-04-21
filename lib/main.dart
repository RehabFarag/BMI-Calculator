import 'package:bmi/features/input/cubit/input_screen_cubit.dart';
import 'package:bmi/features/input/input_screen.dart';
import 'package:bmi/features/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => InputScreenGenderCubit()),
          BlocProvider(create: (context) => InputScreenHeightCubit()),
          BlocProvider(create: (context) => InputScreenWeightCubit()),
          BlocProvider(create: (context) => InputScreenAgeCubit()),
        ],
        child: InputScreen(),
      ),
      routes: {
        'home': (context) => InputScreen(),
        'result': (context) => ResultSreen(),
      },
    );
  }
}
