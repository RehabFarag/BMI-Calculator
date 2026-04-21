import 'package:bmi/core/calculate_recalculate_button.dart';
import 'package:bmi/core/colors_manager.dart';
import 'package:bmi/core/style_manager.dart';
import 'package:bmi/features/input/Widgets/gender_card.dart';
import 'package:bmi/features/input/Widgets/weight_age_card.dart';
import 'package:bmi/features/input/cubit/input_screen_cubit.dart';
import 'package:bmi/features/input/cubit/input_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator', style: StyleManager.whiteBoldFont),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorsManager.primaryColor,
          width: double.infinity,
          child: Column(
            children: [
              // Gender Type
              Row(
                children: [
                  GenderCard(genderType: 'Male', icon: Icons.male),
                  GenderCard(genderType: 'Female', icon: Icons.female),
                ],
              ),

              // Height slider
              BlocBuilder<InputScreenHeightCubit, InputScreenHeightState>(
                builder: (context, state) {
                  final myCubit = context.read<InputScreenHeightCubit>();
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsManager.secondaryColor,
                    ),
                    height: 189,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Height', style: StyleManager.greyBoldFont),
                        Slider(
                          activeColor: ColorsManager.pinkColor,
                          min: 100,
                          max: 200,
                          value: state.height,
                          onChanged: (value) {
                            myCubit.changeHeight(value);
                          },
                        ),
                        Text(
                          '${state.height.toInt()}cm',
                          style: StyleManager.bigFontwhite,
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Weight&age
              Row(
                children: [
                  WeightAgeCard(isAge: false),
                  WeightAgeCard(isAge: true),
                ],
              ),

              CalculateRecalculateButton(buttonName: 'Calculate'),
            ],
          ),
        ),
      ),
    );
  }
}
