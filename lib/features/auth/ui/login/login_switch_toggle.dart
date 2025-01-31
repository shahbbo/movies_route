import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginSwitchToggle extends StatelessWidget {
  const LoginSwitchToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 50.0,
      minHeight: 80.0,
      initialLabelIndex: 1,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      icons: [
        // FontAwesomeIcons.mars,
        Icons.abc,
        Icons.abc
      ],
      iconSize: 30.0,
      borderWidth: 2.0,
      borderColor: [Colors.blueGrey],
      activeBgColors: [
        [Colors.blue],
        [Colors.purple]
      ],
      onToggle: (index) {
        print('switched to: $index');
      },
    );
  }
}
