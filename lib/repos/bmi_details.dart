// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BmiClass {
  int height;
  int weight;
  int age;
  BmiClass({
    required this.height,
    required this.weight,
    required this.age,
  });

  BmiClass copyWith({
    int? height,
    int? weight,
    int? age,
  }) {
    return BmiClass(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }
}

class BmiNotifier extends StateNotifier<BmiClass> {
  BmiNotifier() : super(BmiClass(height: 180, weight: 60, age: 21));
  void ageIncrement() {
    state = state.copyWith(age: state.age + 1);
  }

  void ageDecrement() {
    state = state.copyWith(age: state.age - 1);
  }

  void updateHeight(int newHeight) {
    state = state.copyWith(height: newHeight);
  }

  void weightIncrement() {
    state = state.copyWith(weight: state.weight + 1);
  }

  void weightDecrement() {
    state = state.copyWith(weight: state.weight - 1);
  }

  int bmiResult() {
    double bmiResult = state.weight / pow(state.height / 100, 2);
    return bmiResult.toInt();
  }

  String bmiStatus() {
    if (bmiResult() >= 25) {
      return 'Overweight';
    } else if (bmiResult() >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String bmiComment() {
    if (bmiResult() >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more. ';
    } else if (bmiResult() >= 18.5) {
      return 'You have a Normal body weight. Good Job!';
    } else {
      return 'Youu have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
