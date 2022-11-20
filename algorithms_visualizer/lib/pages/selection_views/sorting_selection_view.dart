import 'package:flutter/material.dart';
import 'package:algorithms_visualizer/widgets/button.dart';

class SortingAlgorithmsView extends StatefulWidget {
  const SortingAlgorithmsView({super.key, required this.title});

  final String title;

  @override
  State<SortingAlgorithmsView> createState() => _SortingAlgorithmsViewState();
}

class _SortingAlgorithmsViewState extends State<SortingAlgorithmsView> {
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
                'Choose a sorting algorithm:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 16.0,
              ),
              AppButton(
                  name: "Bubble Sort",
                  onTap: (() => _openBubbleSortView(context))),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Merge Sort",
                onTap: () {},
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Quick Sort",
                onTap: () {},
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Insertion Sort",
                onTap: () {},
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Heap Sort",
                onTap: () {},
                color: Colors.grey,
              ),
              const SizedBox(
                height: 8.0,
              ),
              AppButton(
                name: "Selection Sort",
                onTap: () {},
                color: Colors.grey,
              ),
            ])));
  }

  _openBubbleSortView(BuildContext context) {
    //TODO: use Navigator and MaterialPageRoute to open the SettingsView
    //Play with effect using fullScreenDialog = true or false
    Navigator.pushNamed(context, "/bubble-sort");
  }
}
