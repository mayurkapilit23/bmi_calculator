import 'package:bmi_calculator/features/bmi/presentation/widgets/custom_button2.dart';
import 'package:bmi_calculator/features/bmi/presentation/widgets/custom_gender_card.dart';
import 'package:bmi_calculator/features/bmi/presentation/widgets/custom_height_card.dart';
import 'package:bmi_calculator/features/bmi/presentation/widgets/custom_weight_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bmi_result_screen.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BMI FitIndex Pro",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              //gender section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomGenderCard(
                    onTap: () {
                      HapticFeedback.selectionClick();
                    },
                    isSelected: true,
                    text: 'Male',
                    asset: 'assets/boyIllustration.png',
                  ),

                  CustomGenderCard(
                    isSelected: false,
                    onTap: () {
                      HapticFeedback.selectionClick();
                    },
                    text: 'Female',
                    asset: 'assets/girlIllustration.png',
                  ),
                ],
              ),
              SizedBox(height: 25),

              //Height section
              CustomHeightCard(),
              const SizedBox(height: 25),
              //Weight section
              CustomWeightCard(),

              SizedBox(height: 25),

              CustomButton2(
                text: 'Calculate BMI',
                onTap: () {
                  // Fire the CalculateBMI event if gender is selected
                  // bmiBloc.add(CalculateBMI());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BmiResultScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
