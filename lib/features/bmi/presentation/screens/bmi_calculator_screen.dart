import 'package:bmi_calculator/features/bmi/presentation/widgets/custom_button2.dart';
import 'package:bmi_calculator/features/bmi/presentation/widgets/custom_gender_card.dart';
import 'package:bmi_calculator/features/bmi/presentation/widgets/custom_height_card.dart';
import 'package:bmi_calculator/features/bmi/presentation/widgets/custom_weight_card.dart';
import 'package:bmi_calculator/features/bmi/provider/bmi_provider.dart';
import 'package:bmi_calculator/features/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'bmi_result_screen.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isCurrentlyDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "BMI FitIndex Pro",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: AnimatedCrossFade(
              firstChild: Icon(Icons.sunny),
              secondChild: Icon(Icons.dark_mode),
              crossFadeState: isCurrentlyDark
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300),
            ),
            onPressed: () => themeProvider.toggleTheme(isCurrentlyDark),
          ),
        ],
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
                      bmiProvider.genderSelection(Gender.male);
                    },
                    isSelected: bmiProvider.selectedGender == Gender.male,
                    text: 'Male',
                    asset: 'assets/boyIllustration.png',
                  ),

                  CustomGenderCard(
                    isSelected: bmiProvider.selectedGender == Gender.female,
                    onTap: () {
                      HapticFeedback.selectionClick();
                      bmiProvider.genderSelection(Gender.female);
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
                  // final height = bmiProvider.heightCm;
                  // final weight = bmiProvider.weightKg;
                  // bmiProvider.bmiCalculation(height, weight);
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
