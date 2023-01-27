// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bmi_calculator/const/constants.dart';

class ButtomButton extends StatelessWidget {
  String label;
  Function buttonButtonFunc;
  ButtomButton({
    required this.label,
    required this.buttonButtonFunc,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => buttonButtonFunc()),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kbottomContainerColor,
        ),
        child: Center(
            child: Text(
          label,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
