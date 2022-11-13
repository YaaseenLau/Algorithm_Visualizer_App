import 'package:flutter/material.dart';
import 'package:algorithms_visualizer/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Algorithms Visualizer',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          textTheme: GoogleFonts.chakraPetchTextTheme()),
      initialRoute: "/home",
      routes: {
        "/home": (context) => const MyHomePage(title: 'Algorithms Visualizer'),
        // "/settings": ((context) => const SettingsView())
      },
    );
  }
}
