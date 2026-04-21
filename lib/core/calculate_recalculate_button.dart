import 'package:bmi/core/colors_manager.dart';
import 'package:bmi/core/style_manager.dart';
import 'package:bmi/features/input/cubit/input_screen_cubit.dart';
import 'package:bmi/features/input/cubit/input_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculateRecalculateButton extends StatelessWidget {
  final String buttonName;
  const CalculateRecalculateButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.pinkColor,
      width: double.infinity,
      height: 100,
      child: buttonName == 'Calculate'
          ? BlocBuilder<InputScreenWeightCubit, InputScreenWeightState>(
              builder: (context, state1) {
                return BlocBuilder<
                  InputScreenHeightCubit,
                  InputScreenHeightState
                >(
                  builder: (context, state2) {
                    return MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'result',
                          arguments: {
                            'weight': state1.weight,
                            'height': state2.height,
                          },
                        );
                      },

                      child: Text(buttonName, style: StyleManager.buttonFont),
                    );
                  },
                );
              },
            )
          : MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: Text(buttonName, style: StyleManager.buttonFont),
            ),
    );
  }
}
