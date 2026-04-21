import 'package:bmi/core/colors_manager.dart';
import 'package:bmi/core/style_manager.dart';
import 'package:bmi/features/input/cubit/input_screen_cubit.dart';
import 'package:bmi/features/input/cubit/input_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderCard extends StatelessWidget {
  final String genderType;
  final IconData icon;
  const GenderCard({super.key, required this.genderType, required this.icon});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputScreenGenderCubit, InputScreenGenderState>(
      builder: (context, state) {
        final myCubit = context.read<InputScreenGenderCubit>();
        return Expanded(
          child: GestureDetector(
            onTap: () {
              myCubit.changeGender(genderType);
            },
            child: Container(
              decoration: BoxDecoration(
                color: state.gender == genderType
                    ? ColorsManager.pinkColor
                    : ColorsManager.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 180,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, size: 130, color: Colors.white),
                  Text(genderType, style: StyleManager.greyBoldFont),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
