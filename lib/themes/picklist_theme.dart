import 'package:flutter/material.dart';

final ThemeData picklistTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Color.fromARGB(255, 90, 90, 90),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 90, 90, 90),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 0, 69, 155),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color.fromARGB(255, 234, 234, 234);
            }
            return const Color.fromARGB(255, 0, 69, 155);
          },
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color.fromARGB(255, 0, 69, 155)));
