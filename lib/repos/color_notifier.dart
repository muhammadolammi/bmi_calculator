import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bmi_calculator/const/constants.dart';

class CardColor {
  Color maleCardColor;
  Color femaleCardColor;
  Gender selectedGender;
  CardColor({
    required this.maleCardColor,
    required this.femaleCardColor,
    required this.selectedGender,
  });

  CardColor copyWith({
    Color? maleCardColor,
    Color? femaleCardColor,
    Gender? selectedGender,
  }) {
    return CardColor(
      maleCardColor: maleCardColor ?? this.maleCardColor,
      femaleCardColor: femaleCardColor ?? this.femaleCardColor,
      selectedGender: selectedGender ?? this.selectedGender,
    );
  }

  @override
  String toString() =>
      'CardColor(maleCardColor: $maleCardColor, femaleCardColor: $femaleCardColor, selectedGender: $selectedGender)';

  @override
  bool operator ==(covariant CardColor other) {
    if (identical(this, other)) return true;

    return other.maleCardColor == maleCardColor &&
        other.femaleCardColor == femaleCardColor &&
        other.selectedGender == selectedGender;
  }

  @override
  int get hashCode =>
      maleCardColor.hashCode ^
      femaleCardColor.hashCode ^
      selectedGender.hashCode;
}

class ColorNotifier extends StateNotifier<CardColor> {
  ColorNotifier()
      : super(CardColor(
          femaleCardColor: kinActiveCard,
          maleCardColor: kinActiveCard,
          selectedGender: Gender.uncheck,
        ));

  void updateColor() {
    if (state.selectedGender == Gender.male) {
      state = state.copyWith(maleCardColor: kActiveCard);
      state = state.copyWith(femaleCardColor: kinActiveCard);
    } else if (state.selectedGender == Gender.female) {
      state = state.copyWith(femaleCardColor: kActiveCard);
      state = state.copyWith(maleCardColor: kinActiveCard);
    }
  }

  void updateGender(Gender gender) {
    state = state.copyWith(selectedGender: gender);
  }
}
