import 'package:bmi_calculator/core/widgets/bmiGaugeRangeWidget.dart';
import 'package:bmi_calculator/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/bmi_provider.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<BmiProvider>(
                  builder: (context, bmiProvider, child) {
                    return SizedBox(
                      // color: Colors.white,
                      height: 300,

                      child: BMIGaugeRange(
                        bmi: bmiProvider.bmiResult!,
                        gender: bmiProvider.selectedGender!,
                      ),
                    );
                  },
                ),

                Consumer<BmiProvider>(
                  builder: (context, bmiProvider, child) {
                    return Column(
                      children: [
                        Text(
                          "BMI: ${bmiProvider.bmiResult?.toStringAsFixed(1) ?? '--'}",
                        ),
                        Text("Category: ${bmiProvider.bmiCategory ?? '--'}"),
                      ],
                    );
                  },
                ),

                CustomButton(
                  text: 'Edit Information',
                  onTap: () {
                    HapticFeedback.selectionClick();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
