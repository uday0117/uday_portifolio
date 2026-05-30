import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme() {
    const seed = Color(0xFF0F2A43);
    final base = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.light,
    );
    final colorScheme = base.copyWith(
      primary: const Color(0xFF0F2A43),
      secondary: const Color(0xFFE85D04),
      tertiary: const Color(0xFF00A6A6),
      surface: const Color(0xFFF6F7FB),
      primaryContainer: const Color(0xFFDCE9F6),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.spaceGroteskTextTheme(),
      scaffoldBackgroundColor: const Color(0xFFF2F5FA),
      appBarTheme: const AppBarTheme(centerTitle: false),
      cardTheme: CardThemeData(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      chipTheme: ChipThemeData(
        side: BorderSide(color: colorScheme.outlineVariant),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  static ThemeData darkTheme() {
    const seed = Color(0xFF7CC3FF);
    final base = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.dark,
    );
    final colorScheme = base.copyWith(
      primary: const Color(0xFF8EC7FF),
      secondary: const Color(0xFFFFA94D),
      tertiary: const Color(0xFF3DD6C6),
      surface: const Color(0xFF0B1220),
      primaryContainer: const Color(0xFF1A2D43),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.spaceGroteskTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
      scaffoldBackgroundColor: const Color(0xFF070D18),
      cardTheme: CardThemeData(
        elevation: 3,
        color: const Color(0xFF111A29),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      chipTheme: ChipThemeData(
        side: BorderSide(color: colorScheme.outlineVariant),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: const Color(0xFF07111F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
