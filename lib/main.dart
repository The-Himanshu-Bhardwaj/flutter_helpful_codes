import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'singleton_shared_preferences/singleton_shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ADD THIS LINE HERE TO INITIALISE SHARED PREFERENCES
  await Prefs.init();
  // THIS MAKE THE APP BAR COLOR TRANSPARENT AND DOES NOT TINT COLOR ON SCROLL
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(ResponsiveSizer(
      builder: (_, __, ___) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          )));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // RETURNS ICON INSIDE TOGGLE BUTTON (CHECK & CROSS)
  final WidgetStateProperty<Icon?> _thumbIcon = WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(
          Icons.check,
        );
      }
      return const Icon(Icons.close);
    },
  );

  final _toggle = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Flutter Code Snippets',
                style: TextStyle(fontSize: 20),
              ),

              Transform.scale(
                scale: 1.2,
                child: ValueListenableBuilder(
                  valueListenable: _toggle,
                  builder: (_, toggle, __) {
                    return Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        value: toggle,
                        onChanged: (value) {
                          _toggle.value = value ?? false;
                        });
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
