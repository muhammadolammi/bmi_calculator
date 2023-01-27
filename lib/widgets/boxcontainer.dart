// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final Color color;
  final Widget containerChild;
  BoxContainer({required this.color, required this.containerChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: containerChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
