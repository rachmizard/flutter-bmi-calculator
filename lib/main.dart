import 'package:flutter/material.dart';
import 'package:gender_app/bmi_calculator_page.dart';
import 'package:gender_app/gender_page.dart';
import 'package:gender_app/providers/gender_provider.dart';
import 'package:gender_app/providers/height_provider.dart';
import 'package:gender_app/providers/weight_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => WeightProvider()),
          ChangeNotifierProvider(create: (context) => HeightProvider()),
          ChangeNotifierProvider(create: (context) => GenderProvider()),
        ],
        child: MaterialApp(routes: {
          "/bmi_calculator": ((context) => const BMICalculatorPage())
        }, debugShowCheckedModeBanner: false, home: const GenderPage()));
  }
}
