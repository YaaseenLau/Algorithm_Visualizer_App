import 'dart:math';

import 'package:algorithms_visualizer/algorithms/sorting/sort.dart';
import 'package:algorithms_visualizer/widgets/button.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class SortingView extends StatefulWidget {
  const SortingView({super.key});

  @override
  State<SortingView> createState() => _SortingViewState();
}

class _SortingViewState extends State<SortingView> {
  List<Widget> bars = [];
  double arraySize = 20;

  @override
  Widget build(BuildContext context) {
    arraySize = context.watch<SortingModel>().arraySize;
    bars = context.watch<SortingModel>().bars;

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
          const Text("Change Array Size: "),
          Container(
              height: 30,
              width: 325,
              child: Slider(
                  label: "Array size",
                  value: context.watch<SortingModel>().arraySize,
                  min: 5,
                  max: 20,
                  onChanged: ((value) {
                    context.read<SortingModel>().setArraySize(value);
                    context.read<SortingModel>().generateArray(arraySize);
                  }))),
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
                context.read<SortingModel>().generateArray(arraySize);
              }),
          const SizedBox(
            height: 8,
          ),
          AppButton(
            name: 'Sort',
            onTap: () {
              context.read<SortingModel>().bubblesort();
            },
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}
