import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF02569B),
  // Flutter Blue (main brand color)
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD6E4FF),
  // Light blue container
  onPrimaryContainer: Color(0xFF001D36),

  secondary: Color(0xFF1A1C1E),
  // Flutter Sky Blue
  onSecondary: Color(0xFF003548),
  secondaryContainer: Color(0xFFC6EFFF),
  onSecondaryContainer: Color(0xFF001F2A),

  tertiary: Color(0xFFFFC107),
  // Accent Yellow
  onTertiary: Color(0xFF332B00),
  tertiaryContainer: Color(0xFFFFECB3),
  onTertiaryContainer: Color(0xFF211B00),

  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),

  background: Color(0xFF13B9FD),
  onBackground: Color(0xFF1A1C1E),

  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF1A1C1E),

  surfaceVariant: Color(0xFFE1E8F0),
  onSurfaceVariant: Color(0xFF43474E),

  outline: Color(0xFF76787C),
  outlineVariant: Color(0xFFC4C6CA),

  inverseSurface: Color(0xFF2E3133),
  onInverseSurface: Color(0xFFF1F1F1),
  inversePrimary: Color(0xFF99CBFF),

  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF02569B),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF99CBFF),
  // Soft blue in dark mode
  onPrimary: Color(0xFF003257),
  primaryContainer: Color(0xFF004A80),
  onPrimaryContainer: Color(0xFFD6E4FF),

  secondary: Color(0xFFE1E1E1),
  // Bright sky blue for highlights
  onSecondary: Color(0xFF003546),
  secondaryContainer: Color(0xFF004D65),
  onSecondaryContainer: Color(0xFFC6EFFF),

  tertiary: Color(0xFFFFB300),
  // Warm yellow accent
  onTertiary: Color(0xFF372B00),
  tertiaryContainer: Color(0xFF5A4300),
  onTertiaryContainer: Color(0xFFFFE08B),

  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),

  background: Color(0xFF121212),
  onBackground: Color(0xFF66D3FF),

  surface: Color(0xFF1E1E1E),
  onSurface: Color(0xFFE1E1E1),

  surfaceVariant: Color(0xFF2E3133),
  onSurfaceVariant: Color(0xFFCAC4D0),

  outline: Color(0xFF8E8E93),
  outlineVariant: Color(0xFF3D3F41),

  inverseSurface: Color(0xFFE1E1E1),
  onInverseSurface: Color(0xFF1E1E1E),
  inversePrimary: Color(0xFF02569B),

  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF99CBFF),
  scrim: Color(0xFF000000),
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.primary,
    foregroundColor: lightColorScheme.onPrimary,
    elevation: 0,
  ),
  fontFamily: 'Poppins',
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.primary,
    foregroundColor: darkColorScheme.onPrimary,
    elevation: 0,
  ),
  fontFamily: 'Poppins',
);
