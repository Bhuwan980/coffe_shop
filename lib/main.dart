import 'package:flutter/material.dart';
import 'package:shoes_shop/focus_manager_widget.dart';
import 'package:shoes_shop/home_page.dart';

void main() {
  runApp(const FocusManagerWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // defining theme for all the input field of the app
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
        )),
        // font family for entire application
        fontFamily: 'Cera',
        // primary color for entire application
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 81, 45),
          primary: const Color.fromARGB(255, 0, 81, 45),
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      home: HomePage(),
    );
  }
}
