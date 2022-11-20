import 'package:flutter/material.dart';
import 'package:algorithms_visualizer/widgets/button.dart';

class PathFindingAlgorithmsView extends StatefulWidget {
  const PathFindingAlgorithmsView({super.key, required this.title});

  final String title;

  @override
  State<PathFindingAlgorithmsView> createState() =>
      _PathFindingAlgorithmsViewState();
}

class _PathFindingAlgorithmsViewState extends State<PathFindingAlgorithmsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Choose a pathfinding algorithm:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 16.0,
              ),
              AppButton(
                  name: "A*", onTap: (() => _openView(context, "/a-star"))),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Breadth-First_Search",
                onTap: () {},
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Depth_First_Search",
                onTap: () {},
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Djikstra",
                onTap: () {},
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8.0,
              ),
            ])));
  }

  _openView(BuildContext context, String route) {
    //TODO: use Navigator and MaterialPageRoute to open the SettingsView
    //Play with effect using fullScreenDialog = true or false
    Navigator.pushNamed(context, route);
  }
}
