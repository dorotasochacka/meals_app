import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  ThemeData get appTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
      ),
      primarySwatch: Colors.teal,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
      textTheme: GoogleFonts.ralewayTextTheme(),
    );
  }
}
