import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              ValueListenableBuilder(valueListenable: _toggle, builder: (_, toggle, __) {
                return SizedBox(
                  width: 40,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                      thumbIcon: _thumbIcon,
                      activeColor: Colors.blue,

                      value: toggle,
                      onChanged: (bool value) {
                        _toggle.value = value;
                      },
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
