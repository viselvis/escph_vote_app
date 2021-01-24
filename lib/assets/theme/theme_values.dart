import 'package:flutter/material.dart';

/// ----  Blue  ----
final bluePrimary       = Color(0xFF0032a3);
final blueLight         = Color(0xFF535bd5);
final blueDark          = Color(0xFF000f73);
final blueTheme = ThemeData(
    primaryColor: bluePrimary,
    accentColor: blueLight,
    backgroundColor: blueDark
);

/// ----  Gold  ----
final goldPrimary       = Color(0xFFd6af1f);
final goldLight         = Color(0xFFffe156);
final goldDark          = Color(0xFFa08000);
final goldTheme = ThemeData(
  primaryColor: goldPrimary,
  accentColor: goldLight,
  backgroundColor: goldDark,
);

// --- Gradient background for splash/login pages
final bgGradient = BoxDecoration(
  gradient: new LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [goldLight, goldDark],
  )
);

