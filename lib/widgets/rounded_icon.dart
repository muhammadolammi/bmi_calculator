// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Function iconFunc;
  final IconData icon;
  const RoundedIconButton({
    required this.iconFunc,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (() {
        iconFunc();
      }),
      elevation: 0.0,
      fillColor: Color(0XFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: CircleBorder(),
      child: Icon(icon),
    );
  }
}
