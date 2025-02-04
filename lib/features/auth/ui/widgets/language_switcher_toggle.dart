import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/asset_manager.dart';
import '../../../app_layout/logic/app_cubit.dart';

class LanguageSwitchToggle extends StatefulWidget {
  const LanguageSwitchToggle({super.key});

  @override
  State<LanguageSwitchToggle> createState() => _LanguageSwitchToggleState();
}

class _LanguageSwitchToggleState extends State<LanguageSwitchToggle> {
  bool positive = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        final appCubit = AppCubit.get(context);
        return AnimatedToggleSwitch<bool>.dual(
            current: positive,
            first: false,
            second: true,
            spacing: 10.0,
            indicatorSize: Size(35, 35),
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
            height: 46,
            onChanged: (lang) async {
              setState(() => positive = lang);
              await appCubit.cachedLanguageCode(lang ? 'en' : 'ar');
            },
            styleBuilder: (b) => ToggleStyle(
                indicatorColor:
                    b ? ColorManager.yellowColor : ColorManager.yellowColor),
            iconBuilder: (value) => value
                ? SvgPicture.asset(
                    ImageAssets.usLogo,
                  )
                : SvgPicture.asset(ImageAssets.egyptLogo),
            textBuilder: (value) => value
                ? SvgPicture.asset(ImageAssets.egyptLogo)
                : SvgPicture.asset(ImageAssets.usLogo));
      },
    );
  }
}
