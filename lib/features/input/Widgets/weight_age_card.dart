import 'package:bmi/core/colors_manager.dart';
import 'package:bmi/core/style_manager.dart';
import 'package:bmi/features/input/Widgets/increment_decrement_button.dart';
import 'package:bmi/features/input/cubit/input_screen_cubit.dart';
import 'package:bmi/features/input/cubit/input_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightAgeCard extends StatelessWidget {
  final bool isAge;
  const WeightAgeCard({super.key, required this.isAge});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputScreenAgeCubit, InputScreenAgeState>(
      builder: (context1, state1) {
        return BlocBuilder<InputScreenWeightCubit, InputScreenWeightState>(builder: (context2, state2) {
          
          return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: ColorsManager.secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 180,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  isAge ? 'Age' : 'Weight',
                  style: StyleManager.greyBoldFont,
                ),
                Text(
                  '${isAge ? state1.age : state2.weight}',
                  style: StyleManager.bigFontwhite,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IncrementDecrementButton(
                      icon: Icons.add,
                      ageOrWeight: isAge
                          ? state1.age + 1
                          : state2.weight + 1,
                      isAge: isAge,
                    ),
                    IncrementDecrementButton(
                      icon: Icons.remove,
                      ageOrWeight: isAge
                          ? state1.age - 1
                          : state2.weight - 1,
                      isAge: isAge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
        },);
      },
    );
  }
}
