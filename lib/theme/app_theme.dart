import 'package:flutter/material.dart';
import 'package:mikhuy/theme/theme.dart';

class AppTheme {
  /// Text theme for light mode. Dark text on light surface
  static TextTheme get lightTextTheme {
    return TextTheme(
      headline1: AppTextStyle.headline1,
      headline2: AppTextStyle.headline2,
      headline3: AppTextStyle.headline3,
      subtitle1: AppTextStyle.subtitle1,
      bodyText1: AppTextStyle.body,
      button: AppTextStyle.button,
      caption: AppTextStyle.caption,
      overline: AppTextStyle.overline,
    );
  }

  static ThemeData get light {
    return ThemeData(
      textTheme: lightTextTheme,
      iconTheme: const IconThemeData(size: 32),
      primarySwatch: AppColors.orangeTango,
      backgroundColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        color: AppColors.white,
        foregroundColor: AppColors.matterhorn,
        iconTheme: const IconThemeData(size: 32, color: AppColors.matterhorn),
        elevation: 0,
        actionsIconTheme: IconThemeData(
          size: 32,
          color: AppColors.orangeTango.shade600,
        ),
        toolbarTextStyle: lightTextTheme.headline2,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.orangeTango.shade200;
              }
              return AppColors.white;
            },
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}
