import 'dart:math';
import 'package:algorithms_visualizer/algorithms/sorting/sort_model.dart';
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
              'Sorting Algorithms',
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
                    child: Text(
                  "Some info about bubble sort",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                sortView()
              ])),
            ],
          )),
    );
  }

  Widget sortView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 16.0,
        ),
        Container(
          height: 450,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: bars,
          ),
        ),
        const Text(
          "Change Array Size: ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Container(
            height: 30,
            width: 325,
            child: Slider(
                label: "Array size",
                value: context.watch<SortingModel>().arraySize,
                min: 5,
                max: 20,
                activeColor: (!context.watch<SortingModel>().sorting)
                    ? Colors.amber
                    : Colors.grey,
                onChanged: (!context.watch<SortingModel>().sorting)
                    ? ((value) {
                        context.read<SortingModel>().setArraySize(value);
                        context.read<SortingModel>().generateArray(arraySize);
                      })
                    : ((value) {}))),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 8,
        ),
        AppButton(
            name: "Generate New Array",
            color: (!context.watch<SortingModel>().sorting)
                ? Colors.amber
                : Colors.grey,
            onTap: (!context.watch<SortingModel>().sorting)
                ? () {
                    context.read<SortingModel>().generateArray(arraySize);
                  }
                : () {}),
        const SizedBox(
          height: 8,
        ),
        AppButton(
          name: 'Sort',
          onTap: (!context.watch<SortingModel>().sorting)
              ? () {
                  context.read<SortingModel>().bubblesort();
                }
              : () {},
          color: (!context.watch<SortingModel>().sorting)
              ? Colors.amber
              : Colors.grey,
        )
      ],
    );
  }
}
