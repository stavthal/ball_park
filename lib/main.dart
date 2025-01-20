import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

const Color customBlack = Color(0xFF191919);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BallPark',
      theme: ThemeData(
        textTheme: TextTheme(
          // Display
          displaySmall: GoogleFonts.lato(
            fontSize: 12,
            color: Colors.white,
          ),

          // Body
          bodyMedium: GoogleFonts.lato(
            fontSize: 16,
            color: Colors.white,
          ),

          // Title
          titleSmall: GoogleFonts.lato(
            fontSize: 18,
            color: Colors.white,
          ),
          titleMedium: GoogleFonts.lato(
            fontSize: 24,
            color: Colors.white,
          ),
          titleLarge: GoogleFonts.lato(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: customBlack,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: customBlack,
          titleTextStyle: GoogleFonts.lato(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router, // Use the custom router
    );
  }
}
