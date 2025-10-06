import 'package:bmi_calculator/features/bmi/presentation/screens/bmi_calculator_screen.dart';
import 'package:bmi_calculator/features/bmi/provider/bmi_provider.dart';
import 'package:bmi_calculator/features/theme/presentation/app_themes.dart';
import 'package:bmi_calculator/features/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BmiProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeProvider.themeMode,
          home: BmiCalculatorScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
