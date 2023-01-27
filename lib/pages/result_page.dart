import 'package:bmi_calculator/const/constants.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/boxcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultPgae extends ConsumerStatefulWidget {
  const ResultPgae({super.key});

  @override
  ConsumerState<ResultPgae> createState() => _ResultPgaeState();
}

class _ResultPgaeState extends ConsumerState<ResultPgae> {
  @override
  Widget build(BuildContext context) {
    final bmiDetail = ref.watch(bmiProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kresultTitleStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: BoxContainer(
                color: kboxContainerColor,
                containerChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiDetail.bmiStatus(),
                      style: kresultHeadlineStyle,
                    ),
                    Text(
                      bmiDetail.bmiResult().toStringAsFixed(1),
                      style: kbmiTextStyle,
                    ),
                    Text(
                      bmiDetail.bmiComment(),
                      style: kbmiComment,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          Expanded(
              child: ButtomButton(
            label: 'Re-Calculate',
            buttonButtonFunc: () {
              Navigator.pop(context);
            },
          ))
        ],
      ),
    );
  }
}
