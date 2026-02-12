import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/font_constants.dart';
import '../../core/extensions/theme_data_extensions.dart';
import '../../core/resource/color_manager.dart';

ThemeData darkTheme() {
  return ThemeData(
    focusColor: ColorManager.focusColor,
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: ColorManager.primaryColor,
    primarySwatch: ColorManager.primarySwatch,
    disabledColor: ColorManager.disabledColor,
    shadowColor: ColorManager.darkShadowColor,
    cardColor: ColorManager.darkSurfaceColor,
    scaffoldBackgroundColor: ColorManager.darkBackground,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 25.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.darkTextColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.darkTextColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.darkTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.darkTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.darkTextColor,
      ),
      bodySmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.darkTextColor,
      ),
      labelLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.darkTextColor,
      ),
      labelMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: ColorManager.darkTextColor,
      ),
      labelSmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.darkTextColor,
      ),
    ),
    primaryTextTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 25.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.primaryColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.primaryColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.primaryColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.primaryColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.primaryColor,
      ),
      bodySmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.primaryColor,
      ),
      labelLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.primaryColor,
      ),
      labelMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: ColorManager.primaryColor,
      ),
      labelSmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.primaryColor,
      ),
    ),
    cardTheme: CardThemeData(
      color: ColorManager.cardColor,
      shadowColor: ColorManager.darkShadowColor,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
    dialogTheme: DialogThemeData(
      iconColor: ColorManager.primaryColor,
      shadowColor: ColorManager.darkShadowColor,
      backgroundColor: ColorManager.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
        side: BorderSide(
          color: ColorManager.borderColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
      ),
    ),
    dataTableTheme: DataTableThemeData(
      headingRowColor: WidgetStateColor.resolveWith(
        (states) => ColorManager.primaryColorLight,
      ),
      dataRowColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorManager.primarySwatch.shade100;
        } else if (states.contains(WidgetState.hovered)) {
          return ColorManager.primarySwatch.shade50;
        }
        return ColorManager.backgroundColor;
      }),
      headingTextStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: ColorManager.darkTextColor,
      ),
      dataTextStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ColorManager.darkTextColor,
      ),
      dividerThickness: 1,
    ),
    colorScheme: ColorScheme.dark(
      onError: ColorManager.cardColor,
      shadow: ColorManager.darkShadowColor,
      surface: ColorManager.darkBackground,
      brightness: Brightness.dark,
      primary: ColorManager.primaryColor,
      onPrimary: ColorManager.surfaceColor,
      secondary: ColorManager.primaryColorLight,
      error: ColorManager.error,
      // surface: ColorManager.surfaceColor,
      primaryContainer: ColorManager.darkPrimaryContainerColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
      filled: true,
      fillColor: ColorManager.darkPrimaryContainerColor.withValues(alpha: 0.33),
      hoverColor: ColorManager.primarySwatch.shade300,
      focusColor: ColorManager.surfaceColor,
      labelStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorManager.darkTextColor,
      ),
      errorStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.error,
      ),
      helperStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.error,
      ),
      hintStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.darkTextColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.focusColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: 2.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.borderColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.borderColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.disabledColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        ),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              color: ColorManager.disabledColor,
              width: 2.w,
              style: BorderStyle.solid,
            );
          } else if (states.contains(WidgetState.error)) {
            return BorderSide(
              color: ColorManager.error,
              width: 2.w,
              style: BorderStyle.solid,
            );
          } else if (states.contains(WidgetState.focused)) {
            return BorderSide(
              color: ColorManager.focusColor,
              width: 2.w,
              style: BorderStyle.solid,
            );
          }
          return BorderSide(
            color: ColorManager.borderColor,
            width: 2.w,
            style: BorderStyle.solid,
          );
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade100;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade400;
          }
          return Colors.transparent;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return ColorManager.disabledColor;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.textColor;
          }

          return ColorManager.darkTextColor;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade400;
          } else if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade100;
          }
          return ColorManager.surfaceColor;
        }),
        padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
          if (states.contains(WidgetState.pressed)) {
            return EdgeInsets.symmetric(vertical: 8.h, horizontal: 13.w);
          }
          return EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w);
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 16.sp,
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.w500,
            );
          } else if (states.contains(WidgetState.hovered)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 16.sp,
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.w500,
            );
          }
          return TextStyle(
            fontFamily: FontConstants.mirzaFontFamily,
            fontSize: 14.sp,
            color: ColorManager.primaryColor,
            fontWeight: FontWeight.w500,
          );
        }),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shadowColor: const WidgetStatePropertyAll(ColorManager.darkShadowColor),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade900;
          } else if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade500;
          } else if (states.contains(WidgetState.disabled)) {
            return ColorManager.disabledColor;
          }
          return ColorManager.primaryColor;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return ColorManager.disabledTextColor;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.textColor;
          } else if (states.contains(WidgetState.hovered)) {
            return ColorManager.textColor;
          }
          return ColorManager.darkTextColor;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade100;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade200;
          }
          return ColorManager.surfaceColor;
        }),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
          if (states.contains(WidgetState.disabled)) {
            return RoundedRectangleBorder(
              side: BorderSide(
                color: ColorManager.disabledColor,
                width: 2.w,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(30.r),
            );
          }
          return RoundedRectangleBorder(
            side: BorderSide(
              color: ColorManager.borderColor,
              width: 2.w,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(30.r),
          );
        }),
        padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
          if (states.contains(WidgetState.pressed)) {
            return EdgeInsets.symmetric(vertical: 13.h, horizontal: 23.w);
          }
          return EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w);
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 22.sp,
              color: ColorManager.textColor,
              fontWeight: FontWeight.w500,
            );
          } else if (states.contains(WidgetState.hovered)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 24.sp,
              color: ColorManager.textColor,
              fontWeight: FontWeight.w500,
            );
          }
          return TextStyle(
            fontFamily: FontConstants.mirzaFontFamily,
            fontSize: 26.sp,
            color: ColorManager.darkTextColor,
            fontWeight: FontWeight.w500,
          );
        }),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        shadowColor: const WidgetStatePropertyAll(ColorManager.darkShadowColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
        ),
        side: WidgetStateProperty.resolveWith((states) {
          return BorderSide.none;
          // if (states.contains(MaterialState.disabled)) {
          //   return const BorderSide(
          //       color: ColorManager.disabledColor,
          //       width: 1,
          //       style: BorderStyle.solid);
          // } else if (states.contains(MaterialState.error)) {
          //   return const BorderSide(
          //       color: ColorManager.error,
          //       width: 1,
          //       style: BorderStyle.solid);
          // } else if (states.contains(MaterialState.focused)) {
          //   return const BorderSide(
          //       color: ColorManager.focusColor,
          //       width: 1,
          //       style: BorderStyle.solid);
          // }
          // return const BorderSide(
          //     color: ColorManager.borderColor,
          //     width: 1,
          //     style: BorderStyle.solid);
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade100;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade400;
          }
          return Colors.transparent;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return ColorManager.disabledColor;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.textColor;
          } else if (states.contains(WidgetState.hovered)) {
            return ColorManager.textColor;
          }
          return ColorManager.darkTextColor;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade400;
          } else if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade100;
          }
          return ColorManager.surfaceColor;
        }),
        padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
          if (states.contains(WidgetState.pressed)) {
            return EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w);
          }
          return EdgeInsets.zero;
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 16.sp,
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.w500,
            );
          } else if (states.contains(WidgetState.hovered)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 16.sp,
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.w500,
            );
          }
          return TextStyle(
            fontFamily: FontConstants.mirzaFontFamily,
            fontSize: 14.sp,
            color: ColorManager.textColor,
            fontWeight: FontWeight.w500,
          );
        }),
      ),
    ),
  );
}

ThemeData lightTheme() {
  return ThemeData(
    colorScheme: const ColorScheme(
      primaryContainer: ColorManager.primaryContainerColor,
      brightness: Brightness.light,
      primary: ColorManager.primaryColor,
      onPrimary: ColorManager.backgroundColor,
      secondary: ColorManager.primaryColor,
      onSecondary: ColorManager.backgroundColor,
      error: ColorManager.error,
      onError: ColorManager.darkTextColor,
      shadow: ColorManager.lightShadowColor,
      surface: ColorManager.backgroundColor,
      onSurface: ColorManager.primaryContainerColor,
      // surface: ColorManager.surfaceColor,
      // onSurface: ColorManager.disabledColor
    ),
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: ColorManager.backgroundColor,
    focusColor: ColorManager.focusColor,
    shadowColor: ColorManager.lightShadowColor,
    cardColor: ColorManager.cardColor,
    cardTheme: CardThemeData(
      color: ColorManager.cardColor,
      shadowColor: ColorManager.lightShadowColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
        side: BorderSide(
          color: ColorManager.borderColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: ColorManager.surfaceColor,
      elevation: 2,
      shadowColor: ColorManager.lightShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
        side: BorderSide(
          color: ColorManager.borderColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
      ),
      iconColor: ColorManager.primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: ColorManager.textColor,
      ),
      contentTextStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.secondaryTextColor,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 25.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.textColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.textColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.secondaryTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.secondaryTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.secondaryTextColor,
      ),
      bodySmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.secondaryTextColor,
      ),
      labelLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.textColor,
      ),
      labelMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: ColorManager.textColor,
      ),
      labelSmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.textColor,
      ),
    ),
    primaryTextTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 25.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.primaryColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.primaryColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: ColorManager.primaryColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.primaryColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.primaryColor,
      ),
      bodySmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.primaryColor,
      ),
      labelLarge: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.primaryColor,
      ),
      labelMedium: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: ColorManager.primaryColor,
      ),
      labelSmall: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.primaryColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
      filled: true,
      fillColor: ColorManager.primaryContainerColor.withValues(alpha: 0.33),
      focusColor: ColorManager.focusColor,
      hoverColor: ColorManager.primarySwatch.shade100,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.borderColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      labelStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorManager.secondaryTextColor,
      ),
      errorStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.error,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.focusColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: 2.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.borderColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.disabledColor,
          width: 2.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
    ),
    dataTableTheme: DataTableThemeData(
      headingRowColor: WidgetStateColor.resolveWith(
        (states) => ColorManager.primaryColorLight,
      ),
      dataRowColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorManager.primarySwatch.shade100;
        } else if (states.contains(WidgetState.hovered)) {
          return ColorManager.primarySwatch.shade50;
        }
        return ColorManager.surfaceColor;
      }),
      headingTextStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: ColorManager.textColor,
      ),
      dataTextStyle: TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ColorManager.secondaryTextColor,
      ),
      dividerThickness: 2.w,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        ),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              color: ColorManager.disabledColor,
              width: 2.w,
              style: BorderStyle.solid,
            );
          } else if (states.contains(WidgetState.error)) {
            return BorderSide(
              color: ColorManager.error,
              width: 2.w,
              style: BorderStyle.solid,
            );
          } else if (states.contains(WidgetState.focused)) {
            return BorderSide(
              color: ColorManager.focusColor,
              width: 2.w,
              style: BorderStyle.solid,
            );
          }
          return BorderSide(
            color: ColorManager.borderColor,
            width: 2.w,
            style: BorderStyle.solid,
          );
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade100;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade400;
          }
          return Colors.transparent;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return ColorManager.disabledColor;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.textColor;
          }

          return ColorManager.primaryColor;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade400;
          } else if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade100;
          }
          return ColorManager.surfaceColor;
        }),
        padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
          if (states.contains(WidgetState.pressed)) {
            return EdgeInsets.symmetric(vertical: 8.h, horizontal: 13.w);
          }
          return EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w);
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 16.sp,
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.w500,
            );
          } else if (states.contains(WidgetState.hovered)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 16.sp,
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.w500,
            );
          }
          return TextStyle(
            fontFamily: FontConstants.mirzaFontFamily,
            fontSize: 14.sp,
            color: ColorManager.primaryColor,
            fontWeight: FontWeight.w500,
          );
        }),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shadowColor: const WidgetStatePropertyAll(
          ColorManager.lightShadowColor,
        ),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade900;
          } else if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade500;
          } else if (states.contains(WidgetState.disabled)) {
            return ColorManager.disabledColor;
          }
          return ColorManager.primaryColor;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return ColorManager.disabledTextColor;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.textColor;
          } else if (states.contains(WidgetState.hovered)) {
            return ColorManager.textColor;
          }
          return ColorManager.darkTextColor;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade100;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade400;
          }
          return ColorManager.surfaceColor;
        }),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
          if (states.contains(WidgetState.disabled)) {
            return RoundedRectangleBorder(
              side: BorderSide(
                color: ColorManager.disabledColor,
                width: 2.w,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(30.r),
            );
          }
          return RoundedRectangleBorder(
            side: BorderSide(
              color: ColorManager.borderColor,
              width: 2.w,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(30.r),
          );
        }),
        padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
          if (states.contains(WidgetState.pressed)) {
            return EdgeInsets.symmetric(vertical: 13.h, horizontal: 23.w);
          }
          return EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w);
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 22.sp,
              color: ColorManager.textColor,
              fontWeight: FontWeight.w500,
            );
          } else if (states.contains(WidgetState.hovered)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 24.sp,
              color: ColorManager.textColor,
              fontWeight: FontWeight.w500,
            );
          }
          return TextStyle(
            fontFamily: FontConstants.mirzaFontFamily,
            fontSize: 26.sp,
            color: ColorManager.darkTextColor,
            fontWeight: FontWeight.w500,
          );
        }),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        shadowColor: const WidgetStatePropertyAll(
          ColorManager.lightShadowColor,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
        ),
        side: WidgetStateProperty.resolveWith((states) {
          return BorderSide.none;
          // if (states.contains(MaterialState.disabled)) {
          //   return const BorderSide(
          //       color: ColorManager.disabledColor,
          //       width: 1,
          //       style: BorderStyle.solid);
          // } else if (states.contains(MaterialState.error)) {
          //   return const BorderSide(
          //       color: ColorManager.error,
          //       width: 1,
          //       style: BorderStyle.solid);
          // } else if (states.contains(MaterialState.focused)) {
          //   return const BorderSide(
          //       color: ColorManager.focusColor,
          //       width: 1,
          //       style: BorderStyle.solid);
          // }
          // return const BorderSide(
          //     color: ColorManager.borderColor,
          //     width: 1,
          //     style: BorderStyle.solid);
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade100;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade400;
          }
          return Colors.transparent;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return ColorManager.disabledColor;
          } else if (states.contains(WidgetState.pressed)) {
            return ColorManager.textColor;
          } else if (states.contains(WidgetState.hovered)) {
            return ColorManager.textColor;
          }
          return ColorManager.textColor;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return ColorManager.primarySwatch.shade400;
          } else if (states.contains(WidgetState.hovered)) {
            return ColorManager.primarySwatch.shade100;
          }
          return ColorManager.surfaceColor;
        }),
        padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
          if (states.contains(WidgetState.pressed)) {
            return EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w);
          }
          return EdgeInsets.zero;
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 16.sp,
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.w500,
            );
          } else if (states.contains(WidgetState.hovered)) {
            return TextStyle(
              fontFamily: FontConstants.mirzaFontFamily,
              fontSize: 16.sp,
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.w500,
            );
          }
          return TextStyle(
            fontFamily: FontConstants.mirzaFontFamily,
            fontSize: 14.sp,
            color: ColorManager.textColor,
            fontWeight: FontWeight.w500,
          );
        }),
      ),
    ),
  );
}

extension ElevatedButtonThemeExtension on ThemeData {
  ButtonStyle get cardColorButton => ButtonStyle(
    shadowColor: const WidgetStatePropertyAll(ColorManager.lightShadowColor),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return ColorManager.primarySwatch.shade900;
      } else if (states.contains(WidgetState.hovered)) {
        return ColorManager.primarySwatch.shade500;
      } else if (states.contains(WidgetState.disabled)) {
        return ColorManager.disabledColor;
      }
      return ColorManager.backgroundColor;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return ColorManager.disabledTextColor;
      }
      return ColorManager.textColor;
    }),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return ColorManager.primarySwatch.shade100;
      } else if (states.contains(WidgetState.pressed)) {
        return ColorManager.primarySwatch.shade400;
      }
      return ColorManager.surfaceColor;
    }),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      if (states.contains(WidgetState.disabled)) {
        return RoundedRectangleBorder(
          side: const BorderSide(
            color: ColorManager.disabledColor,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(12.r),
        );
      }
      return RoundedRectangleBorder(
        side: const BorderSide(
          color: ColorManager.borderColor,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12.r),
      );
    }),
    padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
      if (states.contains(WidgetState.pressed)) {
        return EdgeInsets.symmetric(vertical: 13.h, horizontal: 23.w);
      }
      return EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w);
    }),
    textStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return TextStyle(
          fontFamily: FontConstants.mirzaFontFamily,
          fontSize: 22.sp,
          color: ColorManager.textColor,
          fontWeight: FontWeight.w500,
        );
      } else if (states.contains(WidgetState.hovered)) {
        return TextStyle(
          fontFamily: FontConstants.mirzaFontFamily,
          fontSize: 22.sp,
          color: ColorManager.textColor,
          fontWeight: FontWeight.w500,
        );
      }
      return TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 20.sp,
        color: ColorManager.textColor,
        fontWeight: FontWeight.w500,
      );
    }),
  );
  ButtonStyle get redColorButton => ButtonStyle(
    shadowColor: const WidgetStatePropertyAll(ColorManager.lightShadowColor),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return ColorManager.error;
      } else if (states.contains(WidgetState.hovered)) {
        return ColorManager.error.withAlpha(200);
      } else if (states.contains(WidgetState.disabled)) {
        return ColorManager.disabledColor;
      }
      return ColorManager.error;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return ColorManager.disabledTextColor;
      }
      return ColorManager.textColor;
    }),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return ColorManager.error.withAlpha(200);
      } else if (states.contains(WidgetState.pressed)) {
        return ColorManager.error;
      }
      return ColorManager.surfaceColor;
    }),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
      if (states.contains(WidgetState.disabled)) {
        return RoundedRectangleBorder(
          side: const BorderSide(
            color: ColorManager.disabledColor,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(12.r),
        );
      }
      return RoundedRectangleBorder(
        side: const BorderSide(
          color: ColorManager.borderColor,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12.r),
      );
    }),
    padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
      if (states.contains(WidgetState.pressed)) {
        return EdgeInsets.symmetric(vertical: 13.h, horizontal: 23.w);
      }
      return EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w);
    }),
    textStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return TextStyle(
          fontFamily: FontConstants.mirzaFontFamily,
          fontSize: 22.sp,
          color: ColorManager.textColor,
          fontWeight: FontWeight.w500,
        );
      } else if (states.contains(WidgetState.hovered)) {
        return TextStyle(
          fontFamily: FontConstants.mirzaFontFamily,
          fontSize: 22.sp,
          color: ColorManager.textColor,
          fontWeight: FontWeight.w500,
        );
      }
      return TextStyle(
        fontFamily: FontConstants.mirzaFontFamily,
        fontSize: 20.sp,
        color: ColorManager.textColor,
        fontWeight: FontWeight.w500,
      );
    }),
  );
}

extension BorderThemeExtension on ThemeData {
  BorderSide get defaultBorderSide => (isDark)
      ? const BorderSide(
          color: ColorManager.borderColor,
          width: 1,
          style: BorderStyle.solid,
        )
      : const BorderSide(
          color: ColorManager.borderColor,
          width: 1,
          style: BorderStyle.solid,
        );

  BorderSide get defaultBorderSideError => const BorderSide(
    color: ColorManager.error,
    width: 1,
    style: BorderStyle.solid,
  );

  BorderSide get defaultBorderSideShadow => const BorderSide(
    color: ColorManager.lightShadowColor,
    width: 1,
    style: BorderStyle.solid,
  );
  BorderSide get defaultBorderSideDisable => const BorderSide(
    color: ColorManager.disabledColor,
    width: 1,
    style: BorderStyle.solid,
  );
  BorderSide get defaultBorderSideFocus => const BorderSide(
    color: ColorManager.focusColor,
    width: 3,
    style: BorderStyle.solid,
  );
}
