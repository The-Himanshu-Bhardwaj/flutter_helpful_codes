import 'package:flutter/material.dart';

class SwitchPage extends StatelessWidget {
  SwitchPage({super.key});

  final _toggle = ValueNotifier(false);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: _toggle,
            builder: (_, toggle, __) {
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
            }),
      ),
    );
  }
}
