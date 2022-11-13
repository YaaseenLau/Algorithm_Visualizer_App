import 'package:flutter/material.dart';

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
              algorithmButton('Sorting'),
              const SizedBox(
                height: 16.0,
              ),
              algorithmButton('Searching'),
              const SizedBox(
                height: 16.0,
              ),
              algorithmButton('Recursion'),
              const SizedBox(
                height: 16.0,
              ),
              algorithmButton('Graphs'),
              const SizedBox(
                height: 16.0,
              ),
              algorithmButton('Heaps')
            ])));
  }

  GestureDetector algorithmButton(String name) {
    return GestureDetector(
      onTap: () => _openSortingAlgorithmsView(context),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(name)),
    );
  }

  _openSortingAlgorithmsView(BuildContext context) {
    //TODO: use Navigator and MaterialPageRoute to open the SettingsView
    //Play with effect using fullScreenDialog = true or false
    Navigator.pushNamed(context, "/sorting-algorithms");
  }
}
