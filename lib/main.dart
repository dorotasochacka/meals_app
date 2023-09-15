import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/tabs_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
  ),
  primarySwatch: Colors.teal,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
  textTheme: GoogleFonts.ralewayTextTheme(),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking up!',
      theme: theme,
      home: const TabsScreen(),
      initialRoute: '/',
    );
  }
}
