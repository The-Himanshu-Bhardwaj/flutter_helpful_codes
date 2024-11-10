import 'package:flutter/material.dart';

class CheckboxPage extends StatelessWidget {
  CheckboxPage({super.key});

  final _toggle = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.scale(
          scale: 1.2,
          child: ValueListenableBuilder(
            valueListenable: _toggle,
            builder: (_, toggle, __) {
              return Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.black87,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  value: toggle,
                  onChanged: (value) {
                    _toggle.value = value ?? false;
                  });
            },
          ),
        ),
      ),
    );
  }
}
