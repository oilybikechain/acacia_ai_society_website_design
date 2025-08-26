// lib/themes.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Core Color Definitions ---

// --- NEW Light Theme Colors ---
// A clean, professional palette that uses orange as a strong accent.
const Color primaryLight = Color(0xFFF57C00); // A strong, professional orange
const Color secondaryLight = Color(0xFFFFA726); // A lighter, friendly orange
const Color backgroundLight = Color(0xFFF7F7F7); // A very light, soft grey
const Color surfaceLight =
    Colors.white; // Pure white for cards to make them pop
const Color onPrimaryLight = Colors.white;
const Color onSecondaryLight = Colors.black;
const Color onSurfaceLight = Color(
  0xFF1D1D1F,
); // A very dark grey for text (better than pure black)
const Color errorLight = Colors.redAccent;

// Dark Theme Colors (Unchanged)
const Color primaryDark = Color(0xFFFF7000);
const Color secondaryDark = Color(0xFFFF9800);
const Color backgroundDark = Color(0xFF000000);
const Color surfaceDark = Color(0xFF000000);
const Color onPrimaryDark = Colors.white;
const Color onSecondaryDark = Colors.black;
const Color onSurfaceDark = Colors.white;
const Color errorDark = Color(0xFFFF453A);

// --- Light Theme Definition (UPDATED) ---

const ColorScheme lightColorScheme = ColorScheme.light(
  primary: primaryLight,
  secondary: secondaryLight,
  surface: surfaceLight,
  error: errorLight,
  onPrimary: onPrimaryLight,
  onSecondary: onSecondaryLight,
  onSurface: onSurfaceLight, // Using our dark grey text color
  onError: Colors.white,
  brightness: Brightness.light,
);

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: backgroundLight,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundLight, // Match the scaffold for a seamless look
    foregroundColor: lightColorScheme.onSurface,
    elevation: 0, // Modern flat look
    iconTheme: IconThemeData(color: lightColorScheme.primary),
    titleTextStyle: TextStyle(
      color: lightColorScheme.onSurface,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: lightColorScheme.onSurface,
    displayColor: lightColorScheme.onSurface,
    fontFamily: GoogleFonts.inter().fontFamily,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: lightColorScheme.primary),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: lightColorScheme.primary,
      side: BorderSide(color: lightColorScheme.primary.withOpacity(0.5)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  // The base card theme is simple. Our custom widget will add the border.
  cardTheme: CardTheme(
    color: lightColorScheme.surface, // Pure white
    elevation: 2.0, // Subtle shadow
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: lightColorScheme.secondary,
    foregroundColor: lightColorScheme.onSecondary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: lightColorScheme.onSurface.withOpacity(0.2),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: lightColorScheme.onSurface.withOpacity(0.2),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: lightColorScheme.primary, width: 2.0),
    ),
    labelStyle: TextStyle(color: lightColorScheme.onSurface.withOpacity(0.7)),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

// --- Dark Theme Definition (Unchanged) ---

const ColorScheme darkColorScheme = ColorScheme.dark(
  primary: primaryDark,
  secondary: secondaryDark,
  surface: surfaceDark,
  error: errorDark,
  onPrimary: onPrimaryDark,
  onSecondary: onSecondaryDark,
  onSurface: onSurfaceDark,
  onError: Colors.black,
  brightness: Brightness.dark,
);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: backgroundDark,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundDark,
    foregroundColor: darkColorScheme.onSurface,
    elevation: 0, // Match light theme elevation
    iconTheme: IconThemeData(color: darkColorScheme.primary),
    titleTextStyle: TextStyle(
      color: darkColorScheme.onSurface,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: darkColorScheme.onSurface,
    displayColor: darkColorScheme.onSurface,
    fontFamily: GoogleFonts.inter().fontFamily,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColorScheme.primary,
      foregroundColor: darkColorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: darkColorScheme.primary),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: darkColorScheme.primary,
      side: BorderSide(color: darkColorScheme.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  cardTheme: CardTheme(
    color: darkColorScheme.surface,
    elevation: 4.0,
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkColorScheme.secondary,
    foregroundColor: darkColorScheme.onSecondary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: darkColorScheme.onSurface.withAlpha(80)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: darkColorScheme.onSurface.withAlpha(80)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: darkColorScheme.primary, width: 2.0),
    ),
    labelStyle: TextStyle(
      color: darkColorScheme.onSurface.withAlpha((0.7 * 255).round()),
    ),
    hintStyle: TextStyle(
      color: darkColorScheme.onSurface.withAlpha((0.5 * 255).round()),
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
