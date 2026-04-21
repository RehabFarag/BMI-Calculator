abstract class InputScreenGenderState {
  final String gender;

  InputScreenGenderState({required this.gender});
}

class InitialGenderState extends InputScreenGenderState {
  InitialGenderState({required super.gender});
}

class ChangeGenderState extends InputScreenGenderState {
  ChangeGenderState({required super.gender});
}

abstract class InputScreenHeightState {
  final double height;

  InputScreenHeightState({required this.height});
}

class InitialHeightState extends InputScreenHeightState {
  InitialHeightState({required super.height});
}

class ChangeHeightState extends InputScreenHeightState {
  ChangeHeightState({required super.height});
}

abstract class InputScreenWeightState {
  final int weight;

  InputScreenWeightState({required this.weight});
}

class InitialWeightState extends InputScreenWeightState {
  InitialWeightState({required super.weight});
}

class ChangeWeightState extends InputScreenWeightState {
  ChangeWeightState({required super.weight});
}

abstract class InputScreenAgeState {
  final int age;

  InputScreenAgeState({required this.age});
}

class InitialAgeState extends InputScreenAgeState {
  InitialAgeState({required super.age});
}

class ChangeAgeState extends InputScreenAgeState {
  ChangeAgeState({required super.age});
}
