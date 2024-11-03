import 'package:flutter/material.dart';

class YesButton extends StatelessWidget {
  const YesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(10),
      child: const Text('YES', textAlign: TextAlign.center, style: TextStyle(
        fontSize: 13,
        color: Colors.white,
      ),),
    );
  }
}