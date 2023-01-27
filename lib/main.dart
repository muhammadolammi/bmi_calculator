import 'package:bmi_calculator/const/constants.dart';
import 'package:bmi_calculator/pages/homapage.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/repos/bmi_details.dart';
import 'package:bmi_calculator/repos/color_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardColorProvider =
    StateNotifierProvider<ColorNotifier, CardColor>(((ref) {
  return ColorNotifier();
}));

final bmiProvider = StateNotifierProvider<BmiNotifier, BmiClass>(((ref) {
  return BmiNotifier();
}));
void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0B1033),
// backgroundColor: Colors.red,
        ),
        scaffoldBackgroundColor: const Color(0xff0B1033),
      ),
      initialRoute: khomeRoute,
      routes: {
        khomeRoute: (context) => const HomePage(),
        kresultRoute: (context) => const ResultPgae(),
      },
      title: 'bmi calculator',
      debugShowCheckedModeBanner: false,
    ),
  ));
}
