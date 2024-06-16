import 'package:flutter/material.dart';
import 'package:expnses_ex/widget/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme =
    ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 5, 99, 125),
      );

void main() {
  runApp(
    MaterialApp(
      // remove debug banner
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith( 
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimaryContainer,
          foregroundColor: kDarkColorScheme.primaryContainer,
          centerTitle: true,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.primaryContainer,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(5),
          elevation: 5,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(3),
            elevation: 5,
            shadowColor: kDarkColorScheme.primary,
            backgroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
        textTheme: TextTheme().copyWith(
          titleLarge: ThemeData().textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            // color: kDarkColorScheme.primaryContainer,
            fontSize: 20,
          ),
          bodyMedium: ThemeData().textTheme.bodyMedium!.copyWith(
            // color: kDarkColorScheme.primaryContainer,
            fontSize: 16,
          ),
          titleSmall: ThemeData().textTheme.titleSmall!.copyWith(
            // color: kDarkColorScheme.onPrimary,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
          centerTitle: true,
        ),
        cardTheme: const CardTheme().copyWith(
          // color: kColorScheme.secondaryContainer,
          // // setting foreground color 
          //  shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: kColorScheme.primaryContainer,
          
          margin: const EdgeInsets.all(5),
          elevation: 5,          
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(3),
            elevation: 5,
            shadowColor: kColorScheme.primary,
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: TextTheme().copyWith(
          titleLarge: ThemeData().textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
      //          foreground: Paint()..color = kColorScheme.primaryContainer,
            // color: kColorScheme.primaryContainer,
                // color: Colors.black,
                fontSize: 20,
              ),
          bodyMedium: ThemeData().textTheme.bodyMedium!.copyWith(
            // color: kColorScheme.primaryContainer,
            // color: Colors.black,
            fontSize: 16,
          ), 
          titleSmall: ThemeData().textTheme.titleSmall!.copyWith(
            // color: kColorScheme.onPrimary,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
      themeMode: ThemeMode.system, // ThemeMode.system is default
      home: const Expenses(),
    ),
  );
}
