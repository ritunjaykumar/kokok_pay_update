import 'package:flutter/material.dart';
import '/resources/style_manager.dart';
import '/resources/size_manager.dart';

import 'color_manager.dart';

class ThemeResources {
  const ThemeResources._singleton();

  static const ThemeResources _instance = ThemeResources._singleton();

  factory ThemeResources() => _instance;

  ThemeData getLightThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        elevation: SizeResource.value_0,
        color: ColorResource.lightPrimary,
        titleTextStyle: StyleResource.textTheme.titleMedium,
        iconTheme: const IconThemeData(color: ColorResource.white),
      ),
      iconTheme: const IconThemeData(
        color: ColorResource.white,
        size: 24,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorResource.lightPrimary,
      ),
      textTheme: StyleResource.textTheme,
      cardTheme: const CardTheme().copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeResource.value_12,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: SizeResource.value_12,
          vertical: SizeResource.value_4,
        ),
        elevation: SizeResource.value_4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorResource.lightPrimary,
          textStyle: StyleResource.textTheme.titleMedium,
          foregroundColor: ColorResource.white,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: ColorResource.lightPrimary,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: SizeResource.value_18,
            vertical: SizeResource.value_16,
          ),
          enabledBorder: _getOutlineInputBorder(ColorResource.lightPrimary),
          focusedBorder: _getOutlineInputBorder(ColorResource.lightSecondary),
          errorBorder: _getOutlineInputBorder(ColorResource.lightError.withOpacity(0.8)),
          focusedErrorBorder: _getOutlineInputBorder(ColorResource.lightError),
          disabledBorder: _getOutlineInputBorder(ColorResource.lightPrimary.withOpacity(0.5)),
          prefixIconColor: ColorResource.lightPrimary.withOpacity(0.5)),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(ColorResource.white),
        fillColor: MaterialStateProperty.all<Color>(ColorResource.lightSecondary),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorResource.white,
        elevation: SizeResource.value_4,
        selectedIconTheme: const IconThemeData(color: ColorResource.lightPrimary),
        selectedLabelStyle: StyleResource.textTheme.bodySmall,
        selectedItemColor: ColorResource.lightBlack.withOpacity(0.9),
        unselectedIconTheme: const IconThemeData(color: ColorResource.lightPrimary),
        unselectedLabelStyle: StyleResource.textTheme.bodySmall,
        unselectedItemColor: ColorResource.lightBlack.withOpacity(0.9),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  static OutlineInputBorder _getOutlineInputBorder(final Color color) {
    return OutlineInputBorder(
      borderSide: const BorderSide().copyWith(
        width: SizeResource.value_1_5,
        color: color,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(SizeResource.value_8),
      ),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorResource.lightPrimary,
    // onPrimary: ColorResource.lightBlack,
    onPrimary: ColorResource.white,
    primaryContainer: ColorResource.lightPrimaryContainer,
    onPrimaryContainer: ColorResource.onLightPrimaryContainer,
    secondary: ColorResource.lightSecondary,
    onSecondary: ColorResource.white,
    // onSecondary: ColorResource.lightBlack,
    secondaryContainer: ColorResource.lightSecondaryContainer,
    onSecondaryContainer: ColorResource.onLightSecondaryContainer,
    tertiary: ColorResource.lightTertiary,
    onTertiary: ColorResource.white,
    // onTertiary: ColorResource.lightBlack,
    tertiaryContainer: ColorResource.lightTertiaryContainer,
    onTertiaryContainer: ColorResource.onLightTertiaryContainer,
    error: ColorResource.lightError,
    errorContainer: ColorResource.lightErrorContainer,
    onError: ColorResource.white,
    onErrorContainer: ColorResource.onLightErrorContainer,
    background: ColorResource.lightBackground,
    onBackground: ColorResource.onLightBackground,
    surface: ColorResource.lightBackground,
    onSurface: ColorResource.onLightBackground,
    surfaceVariant: ColorResource.lightSurfaceVariant,
    onSurfaceVariant: ColorResource.onLightSurfaceVariant,
    outline: ColorResource.lightOutline,
    onInverseSurface: ColorResource.onLightInverseSurface,
    inverseSurface: ColorResource.lightInverseSurface,
    inversePrimary: ColorResource.lightInversePrimary,
    shadow: ColorResource.lightBlack,
    surfaceTint: ColorResource.lightPrimary,
    outlineVariant: ColorResource.lightOutlineVariant,
    scrim: ColorResource.lightBlack,
  );

// +++++++++++++++++++++++++++++++dark theme++++++++++++++++++++++++++++++
  ThemeData getDarkThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      // textTheme: Typography.englishLike2021,
      textTheme: StyleResource.textTheme,
      appBarTheme: const AppBarTheme(
        elevation: SizeResource.value_0,
      ),
      cardTheme: const CardTheme().copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeResource.value_12,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: SizeResource.value_12,
          vertical: SizeResource.value_4,
        ),
        elevation: SizeResource.value_4,
      ),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: SizeResource.value_18,
          vertical: SizeResource.value_16,
        ),
        enabledBorder: _getOutlineInputBorder(ColorResource.darkPrimary),
        focusedBorder: _getOutlineInputBorder(ColorResource.darkPrimary),
        errorBorder: _getOutlineInputBorder(ColorResource.darkError.withOpacity(0.8)),
        focusedErrorBorder: _getOutlineInputBorder(ColorResource.darkError),
        disabledBorder: _getOutlineInputBorder(ColorResource.darkPrimary.withOpacity(0.5)),
      ),
    );
  }

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: ColorResource.darkPrimary,
    onPrimary: ColorResource.darkWhite,
    primaryContainer: ColorResource.darkPrimaryContainer,
    onPrimaryContainer: ColorResource.onDarkPrimaryContainer,
    secondary: ColorResource.darkSecondary,
    onSecondary: ColorResource.darkWhite,
    secondaryContainer: ColorResource.darkSecondaryContainer,
    onSecondaryContainer: ColorResource.onDarkSecondaryContainer,
    tertiary: ColorResource.darkTertiary,
    onTertiary: ColorResource.darkWhite,
    tertiaryContainer: ColorResource.darkTertiaryContainer,
    onTertiaryContainer: ColorResource.onDarkTertiaryContainer,
    error: ColorResource.darkError,
    errorContainer: ColorResource.darkErrorContainer,
    onError: ColorResource.darkWhite,
    onErrorContainer: ColorResource.onDarkErrorContainer,
    background: ColorResource.darkBackground,
    onBackground: ColorResource.onDarkBackground,
    surface: ColorResource.darkBackground,
    onSurface: ColorResource.onDarkBackground,
    surfaceVariant: ColorResource.darkSurfaceVariant,
    onSurfaceVariant: ColorResource.onDarkSurfaceVariant,
    outline: ColorResource.darkOutline,
    onInverseSurface: ColorResource.onDarkInverseSurface,
    inverseSurface: ColorResource.darkInverseSurface,
    inversePrimary: ColorResource.darkInversePrimary,
    shadow: ColorResource.darkBlack,
    surfaceTint: ColorResource.darkPrimary,
    outlineVariant: ColorResource.darkOutlineVariant,
    scrim: ColorResource.darkBlack,
  );
}

//------------------------------------------------
