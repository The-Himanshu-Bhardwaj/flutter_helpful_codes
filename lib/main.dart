import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'singleton_shared_preferences/singleton_shared_prefs.dart';

void main() async {
  await Prefs.init(); // << ADD THIS LINE HERE TO INITIALISE SHARED PREFERENCES
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Center(
          child: Text(
            'Flutter Code Snippets',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
