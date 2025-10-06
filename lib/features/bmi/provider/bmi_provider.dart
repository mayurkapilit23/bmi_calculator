import 'package:flutter/material.dart';

enum Gender { male, female }

enum HeightUnit { cm, ft }

enum WeightUnit { kg, lbs }

class BmiProvider extends ChangeNotifier {
  double? _heightCm = 170.0; // always stored in cm
  double? _feet = 5.0;
  double? _inches = 7.0;
  double? _lbs;
  double? _weightKg; // always stored in kg
  double? _bmiResult;
  String? _bmiCategory;
  Gender? _selectedGender;
  HeightUnit _heightUnit = HeightUnit.cm;
  late WeightUnit _weightUnit = WeightUnit.kg;

  double? get heightCm => _heightCm;

  double? get bmiResult => _bmiResult;

  double? get weightKg => _weightKg;

  double? get feet => _feet;

  double? get inches => _inches;

  Gender? get selectedGender => _selectedGender;

  bool get isCm => _heightUnit == HeightUnit.cm;

  bool get isKg => _weightUnit == WeightUnit.kg;

  void setHeightUnit(HeightUnit newUnit) {
    if (_heightUnit == newUnit) {
      return;
    }
    _heightUnit = newUnit;
    notifyListeners();
  }

  void setWeightUnit(WeightUnit newUnit) {
    if (_weightUnit == newUnit) {
      return;
    }

    _weightUnit = newUnit;
    notifyListeners();
  }

  void weightToggle() {
    if (_weightUnit == WeightUnit.kg) {
      _weightUnit = WeightUnit.lbs;
    } else {
      _weightUnit = WeightUnit.kg;
    }
    notifyListeners();
  }

  void heightToggle() {
    if (_heightUnit == HeightUnit.cm) {
      _heightUnit = HeightUnit.ft;
    } else {
      _heightUnit = HeightUnit.cm;
    }
    notifyListeners();
  }

  void setHeight(double newHeight) {
    _heightCm = newHeight;
    notifyListeners();
  }

  // void heightToggle() {
  //   _isCm = !_isCm; // Invert the boolean value (true -> false, false -> true)
  //   notifyListeners();
  // }

  void setFeet(double newFeet) {
    _feet = newFeet;
    notifyListeners();
  }

  void setInches(double newInches) {
    _inches = newInches;
    notifyListeners();
  }

  //Gender Select
  void genderSelection(Gender gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  //Height: Ft'Inch -> Cm
  double heightFtToCm() {
    final cm = (feet! * 30.48) + (inches! * 2.54);
    // notifyListeners();
    return cm;
  }

  //Weight:Lls -> Kg
  void weightLbsToKg(lbs) {
    final kg = lbs * 0.453592;

    notifyListeners();
  }

  //BMI Calculation
  void bmiCalculation(height, weight) {
    if (height <= 0 || weight <= 0) return;

    final heightM = height / 100; // cm → m
    _bmiResult = weight / (heightM * heightM);
    notifyListeners();
  }

  //Helper for BMI category
  String _getBmiCategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi <= 24.9) return "Normal";
    if (bmi <= 29.9) return "Overweight";
    return "Obese";
  }
}
