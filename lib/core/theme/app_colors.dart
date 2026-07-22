import 'package:flutter/material.dart';

class AppColors {
  // Brand Primary & Accent Colors
  static const Color primary = Color(0xFF7241EA);
  static const Color primaryVariant = Color(0xFF7037D8);
  static const Color secondary = Color(0xFF9233EA);
  static const Color accent = Color(0xFF00ABF0);

  // Background Surfaces
  static const Color darkBackground = Color(0xFF111827);
  static const Color darkCardSurface = Color(0xFF1F2837);
  static const Color darkChipSurface = Color(0xFF374151);

  static const Color lightBackground = Color(0xFFFBF8FF);
  static const Color lightCardSurface = Color(0xFFFFFFFF);
  static const Color lightChipSurface = Color(0xFFF3F4F6);

  // Standard Gradients
  static const LinearGradient brandGradient = LinearGradient(
    colors: [
      Color(0xFF7241EA),
      Color(0xFF783EE8),
      Color(0xFF793EEA),
      Color(0xFF7E3CEA),
      Color(0xFF833AEA),
      Color(0xFF8334E2),
      Color(0xFF9233EA),
    ],
  );

  static const LinearGradient darkHeroGradient = LinearGradient(
    colors: [
      Color(0xFF111827),
      Color(0xFF141C2B),
      Color(0xFF1F2837),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightHeroGradient = LinearGradient(
    colors: [
      Color(0xFFF1F7FF),
      Color(0xFFF8FBFF),
      Color(0xFFFBF8FF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
