import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/boxcontainer.dart';
import 'package:bmi_calculator/widgets/iconContent.dart';
import 'package:bmi_calculator/widgets/rounded_icon.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/const/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  void changeColor() {
    ref.read(cardColorProvider.notifier).updateColor();
  }

  void updateHeight(newHeight) {
    ref.read(bmiProvider.notifier).updateHeight(newHeight);
  }

  void addWeight() {
    ref.read(bmiProvider.notifier).weightIncrement();
  }

  void minusWeight() {
    ref.read(bmiProvider.notifier).weightDecrement();
  }

  void addAge() {
    ref.read(bmiProvider.notifier).ageIncrement();
  }

  void minusAge() {
    ref.read(bmiProvider.notifier).ageIncrement();
  }

  void nextPage() {
    Navigator.pushNamed(context, kresultRoute);
  }

  @override
  Widget build(BuildContext context) {
    final cardGender = ref.watch(cardColorProvider.notifier);
    final cardColor = ref.watch(cardColorProvider);

    final bmi = ref.watch(bmiProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (() {
                      cardGender.updateGender(Gender.male);
                      changeColor();
                    }),
                    child: BoxContainer(
                      color: cardColor.maleCardColor,
                      containerChild: const IconColumn(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      cardGender.updateGender(Gender.female);
                      changeColor();
                    },
                    child: BoxContainer(
                      color: cardColor.femaleCardColor,
                      containerChild: const IconColumn(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxContainer(
                      color: kboxContainerColor,
                      containerChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Height',
                            style: ktextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                bmi.height.toString(),
                                style: knumberStyle,
                              ),
                              const Text(
                                'cm',
                                style: ktextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 30),
                              overlayColor: const Color(0X25EB1555),
                              activeTrackColor: Colors.white,
                              thumbColor: const Color(0XFFEB1555),
                              inactiveTrackColor: const Color(0XFF8D8E98),
                            ),
                            child: Slider(
                                value: bmi.height.toDouble(),
                                min: 120,
                                max: 220,
                                onChanged: ((value) {
                                  updateHeight(value.toInt());
                                })),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: BoxContainer(
                      color: kboxContainerColor,
                      containerChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: ktextStyle,
                          ),
                          Text(
                            bmi.weight.toString(),
                            style: knumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                  iconFunc: () {
                                    addWeight();
                                  },
                                  icon: FontAwesomeIcons.plus),
                              const SizedBox(
                                width: 20,
                              ),
                              RoundedIconButton(
                                  iconFunc: () {
                                    minusWeight();
                                  },
                                  icon: FontAwesomeIcons.minus),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          )
                        ],
                      ))),
              Expanded(
                  child: BoxContainer(
                      color: kboxContainerColor,
                      containerChild: Column(
                        children: [
                          const Text(
                            'Age',
                            style: ktextStyle,
                          ),
                          Text(
                            bmi.age.toString(),
                            style: knumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                  iconFunc: () {
                                    addAge();
                                  },
                                  icon: FontAwesomeIcons.plus),
                              const SizedBox(
                                width: 20,
                              ),
                              RoundedIconButton(
                                  iconFunc: () {
                                    minusAge();
                                  },
                                  icon: FontAwesomeIcons.minus),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          )
                        ],
                      ))),
            ],
          )),
          ButtomButton(
            label: 'Calculate',
            buttonButtonFunc: nextPage,
          ),
        ],
      ),
    );
  }
}
