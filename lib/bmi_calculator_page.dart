import 'dart:math';
import 'package:flutter/material.dart';

import 'package:gender_app/providers/gender_provider.dart';
import 'package:gender_app/providers/height_provider.dart';
import 'package:gender_app/providers/weight_provider.dart';
import 'package:provider/provider.dart';

class BMICalculatorPage extends StatelessWidget {
  const BMICalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeightProvider weightProvider = Provider.of<WeightProvider>(context);
    HeightProvider heightProvider = Provider.of<HeightProvider>(context);
    GenderProvider genderProvider = Provider.of<GenderProvider>(context);

    String getCalculatedBMI() {
      double height = heightProvider.height / 100;
      double weight = weightProvider.weight;
      double bmi = weight / pow(height, 2);
      return bmi.toStringAsFixed(1);
    }

    String getIdealStatus() {
      double height = heightProvider.height / 100;
      double weight = weightProvider.weight;
      double bmi = weight / pow(height, 2);

      if (bmi < 18.5) {
        return "Underweight";
      }

      if (bmi >= 18.5 && bmi < 24.9) {
        return "Normal";
      }

      if (bmi >= 25 && bmi < 30) {
        return "Overweight";
      }

      return "Obese";
    }

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Your gender\n${genderProvider.isMale ? "Male" : "Female"}",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Your Weight (Kg):'),
          Slider(
            max: 100,
            min: 1,
            divisions: 100,
            label: weightProvider.weight.round().toString(),
            onChanged: (newValue) {
              newValue = newValue.roundToDouble();
              weightProvider.weight = newValue;
            },
            value: weightProvider.weight,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Your Height (cm):'),
          Slider(
            max: 200,
            min: 1,
            activeColor: Colors.pink,
            inactiveColor: Colors.pink.withOpacity(0.2),
            divisions: 200,
            label: heightProvider.height.round().toString(),
            onChanged: (newValue) {
              newValue = newValue.roundToDouble();
              heightProvider.height = newValue;
            },
            value: heightProvider.height,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Your BMI:\n${(getCalculatedBMI())}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Ideal Status\n${getIdealStatus()}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}
