import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(const PerfumeApp());
}

class PerfumeApp extends StatelessWidget {
  const PerfumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'L\\'Essence',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
          primary: Colors.black,
        ),
        scaffoldBackgroundColor: const Color(0xFFFAF9F6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFAF9F6),
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        fontFamily: 'Georgia', // Using a built-in serif font approximation
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}
