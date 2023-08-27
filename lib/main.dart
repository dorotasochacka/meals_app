
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/tabs_screen.dart';
//import 'package:meals_app/data.dart';
//import 'package:meals_app/screens/meals_screen.dart';

//import 'screens/meal_detail_screen.dart';
//import 'screens/categories_screen.dart';
// import 'screens/meals_screen.dart';
// import 'screens/tabs_screen.dart';
// import 'screens/filters_screen.dart';

import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Colors
        .teal, // robi tekst (oznaczony jako primary) i kolor w circle avatar, nie robi koloru appbaru
  ),
  primarySwatch: Colors
      .teal, // robi kolor w: 'color: Theme.of(context).secondaryHeaderColor,' - czyli kolor tla, nie robi appbara
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
      routes: const {
        //'/': (ctx) => const CategoriesScreen(),
        // MealsScreen.routeName: (ctx) => const MealsScreen(),
        // MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        // FiltersScreen.routeName: (context) => const FiltersScreen(),
      },
      // onUnknownRoute: (settings) => MaterialPageRoute(
      //   builder: (context) => const CategoriesScreen(),
      //),
    );
  }
}
