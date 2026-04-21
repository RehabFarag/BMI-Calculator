import 'package:bmi/features/input/cubit/input_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputScreenGenderCubit extends Cubit<InputScreenGenderState> {
  InputScreenGenderCubit() : super(InitialGenderState(gender: ''));

  void changeGender(String gender) {
    emit(ChangeGenderState(gender: gender));
  }
}

class InputScreenHeightCubit extends Cubit<InputScreenHeightState> {
  InputScreenHeightCubit() : super(InitialHeightState(height: 150));

  void changeHeight(double height) {
    emit(ChangeHeightState(height: height));
  }
}

class InputScreenWeightCubit extends Cubit<InputScreenWeightState> {
  InputScreenWeightCubit() : super(InitialWeightState(weight: 60));

  void changeWeight(int weight) {
    emit(ChangeWeightState(weight: weight));
  }
}

class InputScreenAgeCubit extends Cubit<InputScreenAgeState> {
  InputScreenAgeCubit() : super(InitialAgeState(age: 26));

  void changeAge(int age) {
    emit(ChangeAgeState(age: age));
  }
}
