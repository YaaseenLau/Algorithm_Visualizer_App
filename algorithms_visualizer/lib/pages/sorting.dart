import 'dart:math';

import 'package:algorithms_visualizer/widgets/button.dart';
import 'package:flutter/material.dart';

class SortingView extends StatefulWidget {
  const SortingView({super.key});

  @override
  State<SortingView> createState() => _SortingViewState();
}

class _SortingViewState extends State<SortingView> {
  List<Widget> bars = [];

  generateArray(int size) {
    setState(() {
      bars.clear();
      for (var i = 0; i < size; i++) {
        double randomValue = 20 + (400 - 20) * Random().nextDouble();
        bars.add(createBar(randomValue));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    generateArray(20);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Sorting Algorithms',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 16.0,
          ),
          Container(
            height: 500,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: bars,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          AppButton(
              name: "Generate New Array",
              onTap: () {
                generateArray(20);
              }),
          const SizedBox(
            height: 8,
          ),
          const AppButton(name: 'Sort'),
        ],
      ),
    );
  }

  Widget createBar(double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: height,
        width: 15,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
