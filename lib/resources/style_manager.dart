import 'package:flutter/material.dart';
import 'package:kokok_pay/resources/color_manager.dart';
import '/resources/fonts_manager.dart';
import '/resources/size_manager.dart';

class StyleResource {
  const StyleResource._();

  static final textTheme = const TextTheme().copyWith(
    displayLarge: TextStyle(
      debugLabel: 'englishLike displayLarge 2021',
      inherit: true,
      fontSize: SizeResource.value_57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      height: 1.12,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.opensans.fontName,
    ),
    displayMedium: TextStyle(
        debugLabel: 'englishLike displayMedium 2021',
        inherit: true,
        fontSize: SizeResource.value_45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        height: 1.16,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: FontFamily.opensans.fontName),
    displaySmall: TextStyle(
      debugLabel: 'englishLike displaySmall 2021',
      inherit: true,
      fontSize: SizeResource.value_36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.22,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.opensans.fontName,
    ),
    headlineLarge: TextStyle(
      debugLabel: 'englishLike headlineLarge 2021',
      inherit: true,
      fontSize: SizeResource.value_32,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.25,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.opensans.fontName,
    ),
    headlineMedium: TextStyle(
      debugLabel: 'englishLike headlineMedium 2021',
      inherit: true,
      fontSize: SizeResource.value_28,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.29,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.opensans.fontName,
    ),
    headlineSmall: TextStyle(
      debugLabel: 'englishLike headlineSmall 2021',
      inherit: true,
      fontSize: SizeResource.value_24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.opensans.fontName,
    ),
    titleLarge: TextStyle(
      debugLabel: 'englishLike titleLarge 2021',
      inherit: false,
      fontSize: SizeResource.value_22,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      color: ColorResource.lightBlack,
      height: 1.27,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.opensans.fontName,
    ),
    titleMedium: TextStyle(
      debugLabel: 'englishLike titleMedium 2021',
      inherit: true,
      fontSize: SizeResource.value_16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.50,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.opensans.fontName,
    ),
    titleSmall: TextStyle(
      debugLabel: 'englishLike titleSmall 2021',
      inherit: true,
      fontSize: SizeResource.value_14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.opensans.fontName,
    ),
    labelLarge: TextStyle(
      debugLabel: 'englishLike labelLarge 2021',
      inherit: true,
      fontSize: SizeResource.value_14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.montserrat.fontName,
    ),
    labelMedium: TextStyle(
      debugLabel: 'englishLike labelMedium 2021',
      inherit: true,
      fontSize: SizeResource.value_12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.montserrat.fontName,
    ),
    labelSmall: TextStyle(
      debugLabel: 'englishLike labelSmall 2021',
      inherit: true,
      fontSize: SizeResource.value_12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.45,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.montserrat.fontName,
    ),
    bodyLarge: TextStyle(
      debugLabel: 'englishLike bodyLarge 2021',
      inherit: true,
      fontSize: SizeResource.value_16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.50,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.montserrat.fontName,
    ),
    bodyMedium: TextStyle(
      debugLabel: 'englishLike bodyMedium 2021',
      inherit: true,
      fontSize: SizeResource.value_14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.montserrat.fontName,
    ),
    bodySmall: TextStyle(
      debugLabel: 'englishLike bodySmall 2021',
      inherit: true,
      fontSize: SizeResource.value_12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.montserrat.fontName,
    ),
    //deprecated
    /* headline1: const TextStyle().copyWith(
      fontSize: SizeResource.value_95,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      fontFamily: FontFamily.opensans.fontName,
    ),
    headline2: const TextStyle().copyWith(
      fontSize: SizeResource.value_59,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      fontFamily: FontFamily.opensans.fontName,
    ),
    headline3: const TextStyle().copyWith(
      fontSize: SizeResource.value_48,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.opensans.fontName,
    ),
    headline4: const TextStyle().copyWith(
      fontSize: SizeResource.value_34,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: const TextStyle().copyWith(
      fontSize: SizeResource.value_24,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.opensans.fontName,
    ),
    headline6: const TextStyle().copyWith(
      fontSize: SizeResource.value_20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      fontFamily: FontFamily.opensans.fontName,
    ),
    subtitle1: const TextStyle().copyWith(
      fontSize: SizeResource.value_16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      fontFamily: FontFamily.opensans.fontName,
    ),
    subtitle2: const TextStyle().copyWith(
      fontSize: SizeResource.value_14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      fontFamily: FontFamily.opensans.fontName,
    ),
    bodyText1: const TextStyle().copyWith(
      fontSize: SizeResource.value_16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      fontFamily: FontFamily.montserrat.fontName,
    ),
    bodyText2: const TextStyle().copyWith(
      fontSize: SizeResource.value_14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      fontFamily: FontFamily.montserrat.fontName,
    ),
    button: const TextStyle().copyWith(
      fontSize: SizeResource.value_14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      fontFamily: FontFamily.montserrat.fontName,
    ),
    caption: const TextStyle().copyWith(
      fontSize: SizeResource.value_12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      fontFamily: FontFamily.montserrat.fontName,
    ),
    overline: const TextStyle().copyWith(
      fontSize: SizeResource.value_10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      fontFamily: FontFamily.montserrat.fontName,
    ),*/
  );

/*  TextStyle displayLarge = TextStyle();

  TextStyle? displayMedium = TextStyle();
  TextStyle? displaySmall = TextStyle();
  TextStyle? headlineLarge = TextStyle();
  TextStyle? headlineMedium = TextStyle();
  TextStyle? headlineSmall = TextStyle();
  TextStyle? titleLarge = TextStyle();
  TextStyle? titleMedium = TextStyle();
  TextStyle? titleSmall = TextStyle();
  TextStyle? bodyLarge = TextStyle();
  TextStyle? bodyMedium = TextStyle();
  TextStyle? bodySmall = TextStyle();
  TextStyle? labelLarge = TextStyle();
  TextStyle? labelMedium = TextStyle();
  TextStyle? labelSmall = TextStyle();*/
}
