import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery/core/utils/themes/text_styles/app_text_styles.dart';
import 'colors/app_colors.dart';
import 'dimensions/app_dimensions.dart';

class AppTheme {
  static final AppTheme _appTheme = AppTheme._internal();
  factory AppTheme() {
    return _appTheme;
  }
  AppTheme._internal();
  void setSystemColors() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
  }

  InputBorder _inputBorder({double width = 1.2}) {
    return OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(100));
  }

  ThemeData getAppThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.transparent),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(15),
        enabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(),
        errorBorder: _inputBorder(width: 1),
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: AppColors.whiteColor,
        filled: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size.fromWidth(double.maxFinite)),
            textStyle: MaterialStateProperty.all(AppTextStyles.defaultTextButtonsStyle),
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.borderRadius)))),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.secondaryColor,
        selectionColor: AppColors.secondaryColor,
        selectionHandleColor: Colors.transparent,
      ),
    );
  }
}
