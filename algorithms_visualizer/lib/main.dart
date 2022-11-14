import 'package:algorithms_visualizer/pages/sorting_view.dart';
import 'package:flutter/material.dart';
import 'package:algorithms_visualizer/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'algorithms/sorting/sort_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => SortingModel()))
  ], child: const MyApp()));
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
          primarySwatch: Colors.amber,
          textTheme: GoogleFonts.chakraPetchTextTheme()),
      initialRoute: "/home",
      routes: {
        "/home": (context) => const MyHomePage(title: 'Algorithms Visualizer'),
        "/sorting-algorithms": ((context) => const SortingView())
      },
    );
  }
}
