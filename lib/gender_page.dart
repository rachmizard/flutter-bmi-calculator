import 'package:flutter/material.dart';
import 'package:gender_app/providers/gender_provider.dart';
import 'package:gender_app/providers/height_provider.dart';
import 'package:gender_app/providers/weight_provider.dart';
import 'package:provider/provider.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeightProvider weightProvider = Provider.of<WeightProvider>(context);
    HeightProvider heightProvider = Provider.of<HeightProvider>(context);

    resetWeightAndHeight() {
      weightProvider.weight = 50;
      heightProvider.height = 100;
    }

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<GenderProvider>(
            builder: (context, genderProvider, _) => Text("Choose Your Gender",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: genderProvider.color)),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Consumer<GenderProvider>(
                      builder: (context, genderProvider, _) => GestureDetector(
                        onTap: () => genderProvider.isMale = true,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: genderProvider.maleColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ('assets/images/icon_male.png'),
                                color: genderProvider.maleColor,
                                height: 80,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: genderProvider.maleColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Consumer<GenderProvider>(
                      builder: (context, genderProvider, _) => GestureDetector(
                        onTap: () => genderProvider.isMale = false,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: genderProvider.femaleColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ('assets/images/icon_female.png'),
                                color: genderProvider.femaleColor,
                                height: 80,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: genderProvider.femaleColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<GenderProvider>(
                builder: (context, genderProvider, _) => ElevatedButton(
                  onPressed: () {
                    resetWeightAndHeight();

                    Navigator.pushNamed(context, '/bmi_calculator');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: genderProvider.color,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 8)),
                  child: const Text('Next'),
                ),
              )
            ],
          )
        ],
      ),
    )));
  }
}
