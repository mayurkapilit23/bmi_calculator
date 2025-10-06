import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const CustomSlider({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: AppColors.accentBlueDarkColor,
        inactiveTrackColor: AppColors.accentBlueDarkColor.withOpacity(0.3),
        trackHeight: 6.0,
        thumbColor: Colors.white,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
        overlayColor: Colors.blueAccent.withOpacity(0.2),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
        valueIndicatorColor: AppColors.accentBlueDarkColor.withOpacity(0.9),
        valueIndicatorTextStyle: const TextStyle(fontSize: 14),
        showValueIndicator: ShowValueIndicator.onDrag,
      ),
      child: Slider(
        value: value,
        min: 100,
        max: 220,
        divisions: 120,
        label: "${value.toStringAsFixed(0)} cm",
        onChanged: onChanged,
      ),
    );
  }
}
