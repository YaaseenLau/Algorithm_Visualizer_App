import 'package:flutter/material.dart';
import 'dart:math';

class SortingModel extends ChangeNotifier {
  //initializing attributes
  List<Widget> _bars = [];
  List<double> _barValues = [];
  // List<Color> _barColours = [];
  double _arraySize = 5;

  SortingModel() {
    generateArray(arraySize);
  }

  //getters
  // List<Color> get barColors => _barColours;
  List<double> get barValues => _barValues;
  List<Widget> get bars => _bars;
  double get arraySize => _arraySize;

  //methods
  bubblesort() {
    print("Before: $barValues");
    bool swapping = true;
    while (swapping) {
      swapping = false;
      for (var i = 0; i < bars.length - 1; i++) {
        if (barValues[i] >= barValues[i + 1]) {
          swapping = true;
          Widget tempBar = bars[i];
          double tempBarValue = barValues[i];
          bars[i] = createBar(barValues[i], Colors.deepPurple);
          bars[i + 1] = createBar(barValues[i + 1], Colors.deepPurple);
          notifyListeners();
          bars[i] = bars[i + 1];
          bars[i + 1] = tempBar;
          barValues[i] = barValues[i + 1];
          barValues[i + 1] = tempBarValue;
        }
      }
    }
    print("After: $barValues");
  }

  setArraySize(double arraySize) {
    _arraySize = arraySize;
    notifyListeners();
  }

  generateArray(double size) {
    bars.clear();
    barValues.clear();
    for (var i = 0; i < size; i++) {
      double randomValue = 20 + (400 - 20) * Random().nextDouble();
      while (barValues.contains(randomValue)) {
        randomValue = 20 + (400 - 20) * Random().nextDouble();
      }
      barValues.add(randomValue);
      bars.add(createBar(randomValue, Colors.black));
    }
    notifyListeners();
  }

  Widget createBar(double height, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: height,
        width: 15,
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }
}
