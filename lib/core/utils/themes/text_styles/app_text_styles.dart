import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle defaultTextButtonsStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static const TextStyle titleStyle = TextStyle(fontSize: 45, fontWeight: FontWeight.w800, letterSpacing: 1.4);
  static const TextStyle loginStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w800, letterSpacing: 1.4);
  static const TextStyle userNameStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.w400, letterSpacing: 1.4);
  static const TextStyle errorStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.redColor);
}
