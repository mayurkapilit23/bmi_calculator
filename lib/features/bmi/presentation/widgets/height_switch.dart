import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/bmi_provider.dart';

class HeightSwitch extends StatelessWidget {
  const HeightSwitch({super.key});

  // Constants
  static const _activeCardColor = Color(0xff3240A1);
  static const _inactiveTextColor = Color(0xFFA0A3BD);
  static const _animationDuration = Duration(milliseconds: 300);
  static const _borderRadius = 8.0;
  static const _switchPadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 4,
  );
  static final _switchDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context);
    return Container(
      decoration: _switchDecoration,
      padding: const EdgeInsets.all(2),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildUnitSwitch(
            label: 'Cm',
            isActive: bmiProvider.isCm,
            onTap: () {
              if (!bmiProvider.isCm) {
                bmiProvider.heightToggle();
              }

              HapticFeedback.selectionClick();
            },
          ),
          SizedBox(width: 2),
          _buildUnitSwitch(
            label: 'Ft',
            isActive: !bmiProvider.isCm,
            onTap: () {
              if (bmiProvider.isCm) {
                bmiProvider.heightToggle();
              }

              HapticFeedback.selectionClick();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUnitSwitch({
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: _animationDuration,
        curve: Curves.easeInOut,
        padding: _switchPadding,
        decoration: BoxDecoration(
          color: isActive ? _activeCardColor : Colors.transparent,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : _inactiveTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
