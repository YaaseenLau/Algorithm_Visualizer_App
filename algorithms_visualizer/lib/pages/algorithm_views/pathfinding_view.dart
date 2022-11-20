import 'dart:math';
import 'package:algorithms_visualizer/algorithms/sorting/sort_model.dart';
import 'package:algorithms_visualizer/widgets/button.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class PathfindingView extends StatefulWidget {
  const PathfindingView({super.key});

  @override
  State<PathfindingView> createState() => _PathfindingViewState();
}

class _PathfindingViewState extends State<PathfindingView> {
  List<Widget> bars = [];
  double arraySize = 20;

  @override
  Widget build(BuildContext context) {
    arraySize = context.watch<SortingModel>().arraySize;
    bars = context.watch<SortingModel>().bars;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: const Text(
              'A*',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              const TabBar(tabs: [
                Tab(icon: Icon(Icons.info_outline)),
                Tab(icon: Icon(Icons.add_chart)),
              ]),
              Expanded(
                  child: TabBarView(children: [
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text(
                    """A* (pronounced "A-star") is a graph traversal and path search algorithm, which is used in many fields of computer science due to its completeness, optimality, and optimal efficiency. One major practical drawback is its O(b^d) space complexity, as it stores all generated nodes in memory. Thus, in practical travel-routing systems, it is generally outperformed by algorithms which can pre-process the graph to attain better performance, as well as memory-bounded approaches; however, A* is still the best solution in many cases.

Peter Hart, Nils Nilsson and Bertram Raphael of Stanford Research Institute (now SRI International) first published the algorithm in 1968. It can be seen as an extension of Dijkstra's algorithm. A* achieves better performance by using heuristics to guide its search.

Compared to Dijkstra's algorithm, the A* algorithm only finds the shortest path from a specified source to a specified goal, and not the shortest-path tree from a specified source to all possible goals. This is a necessary trade-off for using a specific-goal-directed heuristic. For Dijkstra's algorithm, since the entire shortest-path tree is generated, every node is a goal, and there can be no specific-goal-directed heuristic.""",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
                pathfindingView()
              ])),
            ],
          )),
    );
  }

  Widget pathfindingView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 16.0,
        ),
        Container(
          height: 515,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: bars,
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 8,
        ),
        AppButton(
            name: "Clear Walls",
            color: (!context.watch<SortingModel>().sorting)
                ? Colors.amber
                : Colors.grey,
            onTap: (!context.watch<SortingModel>().sorting) ? () {} : () {}),
        const SizedBox(
          height: 8,
        ),
        AppButton(
          name: 'Start Search',
          onTap: (!context.watch<SortingModel>().sorting) ? () {} : () {},
          color: (!context.watch<SortingModel>().sorting)
              ? Colors.amber
              : Colors.grey,
        )
      ],
    );
  }
}
