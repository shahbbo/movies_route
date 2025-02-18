import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/features/app_layout/ui/pages/app_layout.dart';
import 'package:flutter_projects/features/auth/ui/login_screen/login_screen.dart';
import 'package:flutter_projects/features/edit_profile/ui/edit_profile_screen/edit_profile_screen.dart';
import 'package:get/get.dart';

import '../../core/resources/constants.dart';
import '../Onboarding/ui/first_onboard_page.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash Screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    fadingAnimation =
        Tween<double>(begin: .0, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);
    nextPage();
  }

  void nextPage() {
    Future.delayed(const Duration(seconds: 5), () {
      getAllCached();
      print("Splash Screen");
      print(token);
      print(onBoarding);
      if (onBoarding != null) {
        if (token !=null) {
          Get.off(() => const AppLayOut(),
              transition: Transition.rightToLeft);
        } else {
          Get.off(() => LoginScreen(),
              transition: Transition.rightToLeft);
        }
      } else {
        Get.off(() => const FirstOnboardPage(),
            transition: Transition.rightToLeft);
      }
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          Image.asset(ImageAssets.splashLogo),
          Spacer(),
          Image.asset(ImageAssets.splashButtom),
        ],
      ),
    );
  }
}
