import 'package:bmi/features/input/cubit/input_screen_cubit.dart';
import 'package:bmi/features/input/cubit/input_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementDecrementButton extends StatelessWidget {
  final IconData icon;
  final bool isAge;
  final int ageOrWeight;

  const IncrementDecrementButton({
    super.key,
    required this.icon,
    required this.isAge,
    required this.ageOrWeight,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputScreenAgeCubit, InputScreenAgeState>(
      builder: (context, state) {
        final ageCubit = context.read<InputScreenAgeCubit>();
        return BlocBuilder<InputScreenWeightCubit, InputScreenWeightState>(
          builder: (context, state) {
            final weightCubit = context.read<InputScreenWeightCubit>();
            return Expanded(
              child: Container(
                width: 40,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MaterialButton(
                  onPressed: () {
                    if (isAge) {
                      ageCubit.changeAge(ageOrWeight);
                    } else {
                      weightCubit.changeWeight(ageOrWeight);
                    }
                  },
                  child: Icon(icon, size: 30, color: Colors.white),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
