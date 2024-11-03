import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'singleton_shared_preferences/singleton_shared_prefs.dart';

void main() async {
  // ADD THIS LINE HERE TO INITIALISE SHARED PREFERENCES
  await Prefs.init();
  // THIS MAKE THE APP BAR COLOR TRANSPARENT AND DOES NOT TINT COLOR ON SCROLL
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    ResponsiveSizer(builder: (_, __, ___) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ))
  );
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
