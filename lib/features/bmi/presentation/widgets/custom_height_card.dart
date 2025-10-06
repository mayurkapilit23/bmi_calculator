import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_cupertino_picker.dart';
import 'height_switch.dart';

class CustomHeightCard extends StatelessWidget {
  CustomHeightCard({super.key});

  final feetList = List.generate(6, (index) => index + 3);
  final inchList = List.generate(12, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.28;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(15),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isDark
            ? [
                // subtle glow in dark mode
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : [
                // soft shadow in light mode
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Height', style: TextStyle(fontWeight: FontWeight.w700)),
              SizedBox(width: 10),
              HeightSwitch(),
            ],
          ),

          //  CustomSlider(
          //   value: state.heightCm,
          //   onChanged: (v) {
          //     context.read<BmiBloc>().add(HeightChangedCm(v));
          //   },
          // )
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              CustomCupertinoPicker(
                valueList: feetList,
                unitText: 'Ft',
                onSelectedItemChanged: (index) {
                  HapticFeedback.selectionClick();
                },
              ),
              CustomCupertinoPicker(
                valueList: inchList,
                unitText: 'Inch',
                onSelectedItemChanged: (index) {
                  HapticFeedback.selectionClick();
                },
              ),
            ],
          ),

          Text('5 feet 3 inches (160 cm)'),
        ],
      ),
    );
  }
}
