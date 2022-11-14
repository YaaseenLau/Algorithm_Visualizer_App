import 'package:algorithms_visualizer/widgets/button.dart';
import 'package:flutter/material.dart';
import '';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                'Choose an algorithm type: ',
              ),
              const SizedBox(
                height: 16.0,
              ),
              AppButton(
                  name: "Sorting",
                  onTap: (() => _openSortingAlgorithmsView(context))),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Searching",
                onTap: () {},
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Recursion",
                onTap: () {},
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Graphs",
                onTap: () {},
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Heaps",
                onTap: () {},
                color: Colors.grey,
              ),
            ])));
  }

  _openSortingAlgorithmsView(BuildContext context) {
    //TODO: use Navigator and MaterialPageRoute to open the SettingsView
    //Play with effect using fullScreenDialog = true or false
    Navigator.pushNamed(context, "/sorting-algorithms");
  }
}
