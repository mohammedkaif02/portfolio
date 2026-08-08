import 'package:flutter/material.dart';
import 'package:mr_portfolio/core/theme/app_colors.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary,
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFEDE7FF),
  onPrimaryContainer: Color(0xFF2D1060),

  secondary: Color(0xFF1A1C1E),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFF3F4F6),
  onSecondaryContainer: Color(0xFF1A1C1E),

  tertiary: AppColors.accent,
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFD6F4FF),
  onTertiaryContainer: Color(0xFF003548),

  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),

  surface: AppColors.lightBackground,
  onSurface: Color(0xFF1A1C1E),

  surfaceContainerHighest: Color(0xFFE8E0F5),
  onSurfaceVariant: Color(0xFF43474E),

  outline: Color(0xFF76787C),
  outlineVariant: Color(0xFFC4C6CA),

  inverseSurface: Color(0xFF2E3133),
  onInverseSurface: Color(0xFFF1F1F1),
  inversePrimary: Color(0xFFC4B5FD),

  shadow: Color(0xFF000000),
  surfaceTint: AppColors.primary,
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFC4B5FD),
  onPrimary: Color(0xFF3B1578),
  primaryContainer: Color(0xFF5527A8),
  onPrimaryContainer: Color(0xFFEDE7FF),

  secondary: Color(0xFFE1E1E1),
  onSecondary: Color(0xFF1A1C1E),
  secondaryContainer: Color(0xFF374151),
  onSecondaryContainer: Color(0xFFE1E1E1),

  tertiary: AppColors.accent,
  onTertiary: Color(0xFF003548),
  tertiaryContainer: Color(0xFF004D65),
  onTertiaryContainer: Color(0xFFC6EFFF),

  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),

  surface: AppColors.darkBackground,
  onSurface: Color(0xFFE1E1E1),

  surfaceContainerHighest: AppColors.darkCardSurface,
  onSurfaceVariant: Color(0xFFCAC4D0),

  outline: Color(0xFF8E8E93),
  outlineVariant: Color(0xFF3D3F41),

  inverseSurface: Color(0xFFE1E1E1),
  onInverseSurface: Color(0xFF1E1E1E),
  inversePrimary: AppColors.primary,

  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFC4B5FD),
  scrim: Color(0xFF000000),
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: AppColors.lightBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: AppColors.primary,
    elevation: 0,
  ),
  fontFamily: 'Poppins',
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: AppColors.darkBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackground,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  fontFamily: 'Poppins',
);
