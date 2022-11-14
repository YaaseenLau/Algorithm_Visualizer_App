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
  double arraySize = 20;

  generateArray(double size) {
    setState(() {
      bars.clear();
      for (var i = 0; i < size; i++) {
        double randomValue = 20 + (400 - 20) * Random().nextDouble();
        bars.add(createBar(randomValue));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateArray(arraySize);
  }

  @override
  Widget build(BuildContext context) {
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
            height: 10,
          ),
          Text("Change Array Size: "),
          Container(
              height: 30,
              width: 325,
              child: Slider(
                  label: "Array size",
                  value: arraySize,
                  min: 5,
                  max: 20,
                  onChanged: ((value) => setState(() {
                        arraySize = value;
                        generateArray(arraySize);
                      })))),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 8,
          ),
          AppButton(
              name: "Generate New Array",
              onTap: () {
                generateArray(20);
              }),
          const SizedBox(
            height: 8,
          ),
          const AppButton(
            name: 'Sort',
            color: Colors.grey,
          ),
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
