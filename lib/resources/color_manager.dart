import 'package:flutter/material.dart';


class ColorResource {
  ColorResource._();

  //onPrimary, onSecondary, onTertiary, onError
  static const Color white = Color(0xFFFFFFFF);

  // shadow, scrim
  static const Color lightBlack = Color(0xFF000000);

  //---------------------------------------------------------
  static const Color lightPrimary = Color(0xFFF68623); //surfaceTint
  static const Color lightPrimaryContainer = Color(0xFFFFDCC5);
  static const Color onLightPrimaryContainer = Color(0xFF301400);
  static const Color lightSecondary = Color(0xFF4854BA);
  static const Color lightSecondaryContainer = Color(0xFFDFE0FF);
  static const Color onLightSecondaryContainer = Color(0xFF000964);
  static const Color lightTertiary = Color(0xFF006A62);
  static const Color lightTertiaryContainer = Color(0xFF72F7E9);
  static const Color onLightTertiaryContainer = Color(0xFF00201D);
  static const Color lightError = Color(0xFFBA1A1A);
  static const Color lightErrorContainer = Color(0xFFFFDAD6);
  static const Color onLightErrorContainer = Color(0xFF410002);
  static const Color lightBackground =
  Color(0xFFF2FFFD); //surface, onInverseSurface
  static const Color onLightBackground = Color(0xFF181E00);
  static const Color lightSurface = Color(0xFFFCFFDE);
  static const Color onLightSurface = Color(0xFF181E00);
  static const Color lightSurfaceVariant = Color(0xFFF3DED2);
  static const Color onLightSurfaceVariant = Color(0xFF52443B);
  static const Color lightOutline = Color(0xFF84746A);
  static const Color onLightInverseSurface = Color(0xFFE6FB88);
  static const Color lightInverseSurface = Color(0xFF2B3400);
  static const Color lightInversePrimary = Color(0xFFFFB784);
  static const Color lightOutlineVariant = Color(0xFFD6C3B7);

  //===========================Dark Theme================================
  static const Color darkWhite = Color(0xFFFFFFFF);

  // shadow, scrim
  static const Color darkBlack = Color(0xFF000000);

  //---------------------------------------------------------
  static const Color darkPrimary = Color(0xFF4CDADD); //surfaceTint
  static const Color darkPrimaryContainer = Color(0xFF003738);
  static const Color onDarkPrimaryContainer = Color(0xFF004F51);
  static const Color darkSecondary = Color(0xFF55D6F3);
  static const Color darkSecondaryContainer = Color(0xFF004E5C);
  static const Color onDarkSecondaryContainer = Color(0xFFABEDFF);
  static const Color darkTertiary = Color(0xFFDEB7FF);
  static const Color darkTertiaryContainer = Color(0xFF5C3382);
  static const Color onDarkTertiaryContainer = Color(0xFFF1DBFF);
  static const Color darkError = Color(0xFFFFB4AB);
  static const Color darkErrorContainer = Color(0xFF93000A);
  static const Color onDarkErrorContainer = Color(0xFFFFDAD6);
  static const Color darkBackground =
  Color(0xFF522B04); //surface, onInverseSurface
  static const Color onDarkBackground = Color(0xFFFFDCC0);
  static const Color darkSurfaceVariant = Color(0xFF3F4949);
  static const Color onDarkSurfaceVariant = Color(0xFFBEC8C8); //outlineVariant
  static const Color darkOutline = Color(0xFF899392);
  static const Color onDarkInverseSurface = Color(0xFF522B04);
  static const Color darkInverseSurface = Color(0xFFFFDCC0);
  static const Color darkInversePrimary = Color(0xFF00696B);
  static const Color darkOutlineVariant = Color(0xFF3F4949);
}
