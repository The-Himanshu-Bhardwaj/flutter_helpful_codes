import 'package:flutter/material.dart';

class NoButton extends StatelessWidget {
  const NoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('NO', textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: Colors.black87,
        ),),
    );
  }
}
