import 'package:bmi/core/calculate_recalculate_button.dart';
import 'package:bmi/core/colors_manager.dart';
import 'package:bmi/core/style_manager.dart';
import 'package:flutter/material.dart';

class ResultSreen extends StatelessWidget {
  const ResultSreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, num> heightWeight =
        ModalRoute.of(context)!.settings.arguments as Map<String, num>;
    final heightInMeter = heightWeight['height']! / 100;
    final weight = heightWeight['weight']!;
    final bmi = weight / (heightInMeter * heightInMeter);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator', style: StyleManager.whiteBoldFont),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorsManager.primaryColor,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Your Result', style: StyleManager.bigFontwhite),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorsManager.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 503,
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getResult(bmi),

                    Text(
                      bmi.toStringAsFixed(1),
                      style: StyleManager.bigFontwhite,
                    ),
                  ],
                ),
              ),
              CalculateRecalculateButton(buttonName: 'Re - Calculate'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getResult(double bmi) {
  if (bmi < 18.5)
    return Text('Underweight', style: TextStyle(color: Colors.green));
  else if (bmi < 25)
    return Text('Normal', style: TextStyle(color: Colors.green));
  else if (bmi < 30)
    return Text('Overweight', style: TextStyle(color: Colors.green));
  else
    return Text('Obese', style: TextStyle(color: Colors.green));
}
