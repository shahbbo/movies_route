import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/customWidgets/custom_button.dart';
import '../../../core/customWidgets/custom_text.dart';
import 'onboarding_pages.dart';

class FirstOnboardPage extends StatelessWidget {
  const FirstOnboardPage({super.key});
  static const String route = "First Onboard Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.moviePoster), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 13,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                text: 'Find Your Next\nFavorite Movie Here',
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text:
                    'Get access to a huge library of movies\nto suit all tastes. You will surely like it.',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: ColorManager.offWhite.withAlpha(140),
              ),
              CustomButton(
                title: "Explore Now",
                style: GoogleFonts.inter(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.blackOn),
                buttonColor: ColorManager.orange,
                textColor: ColorManager.blackOn,
                borderColor: ColorManager.blackOn,
                onPressed: () {
                  navigateWithFade(context, OnboardingPages());
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
