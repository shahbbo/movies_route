import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

import '../../../../core/resources/asset_manager.dart';

class LoginSwitchToggle extends StatefulWidget {
  const LoginSwitchToggle({super.key});

  @override
  State<LoginSwitchToggle> createState() => _LoginSwitchToggleState();
}

class _LoginSwitchToggleState extends State<LoginSwitchToggle> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
        current: positive,
        first: false,
        second: true,
        spacing: 15.0,
        indicatorSize: Size(40, 40),
        // minTouchTargetSize: 0,
        style: ToggleStyle(
          borderColor: ColorManager.yellowColor,
          backgroundColor: ColorManager.mainColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 0.5),
            ),
          ],
        ),
        borderWidth: 3.0,
        height: 50,
        onChanged: (b) => setState(() => positive = b),
        styleBuilder: (b) => ToggleStyle(
            indicatorColor:
                b ? ColorManager.yellowColor : ColorManager.yellowColor),
        iconBuilder: (value) => value
            ? Image(
                image: AssetImage(ImageAssets.usLogo),
              )
            : Image(image: AssetImage(ImageAssets.egyptLogo)),
        textBuilder: (value) => value
            ? Image(image: AssetImage(ImageAssets.egyptLogo))
            : Image(image: AssetImage(ImageAssets.usLogo)));
  }
}
