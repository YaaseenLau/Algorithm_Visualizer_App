import 'package:algorithms_visualizer/pages/algorithm_views/pathfinding_view.dart';
import 'package:algorithms_visualizer/pages/algorithm_views/sorting_view.dart';
import 'package:algorithms_visualizer/pages/selection_views/searching_selection_view.dart';
import 'package:algorithms_visualizer/pages/selection_views/sorting_selection_view.dart';

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
        "/sorting-algorithms": ((context) => const SortingAlgorithmsView(
              title: 'Sorting Algorithms',
            )),
        "/pathfinding-algorithms": ((context) =>
            const PathFindingAlgorithmsView(
              title: 'Pathfinding Algorithms',
            )),
        "/bubble-sort": ((context) => const SortingView()),
        "/a-star": ((context) => const PathfindingView()),
      },
    );
  }
}
