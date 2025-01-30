import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/components/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';
import 'package:flutter_projects/pages/Onboarding/onboarding_pages.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText(
              text: 'Find Your Next\nFavorite Movie Here',
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              text:
                  'Get access to a huge library of movies\nto suit all tastes. You will surely like it.',
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: ColorManager.offWhite.withAlpha(140),
            ),
            SizedBox(
              height: 0,
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
    );
  }
}
