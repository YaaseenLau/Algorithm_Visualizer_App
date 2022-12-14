import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, required this.name, this.onTap, this.color = Colors.amber});
  final String name;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 400,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
          decoration: BoxDecoration(
            color: color,
            // borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
