import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/features/auth/ui/login_screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/customWidgets/custom_button.dart';
import '../../../core/customWidgets/custom_text.dart';
import 'intro_widget.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});
  static const String route = "Onboarding Screens";

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  int selectIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updatePageIndex);
  }

  void _updatePageIndex() {
    final newIndex = _pageController.page!.round();
    if (newIndex != selectIndex) {
      setState(() => selectIndex = newIndex);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Discover Movies',
      'image': ImageAssets.onboard1,
      'description':
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    },
    {
      'title': 'Explore All Genres',
      'image': ImageAssets.onboard2,
      'description':
          'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    },
    {
      'title': 'Create Watchlists',
      'image': ImageAssets.onboard3,
      'description':
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    },
    {
      'title': 'Rate, Review, and Learn',
      'image': ImageAssets.onboard4,
      'description':
          'Share your thoughts on the movies you\'ve watched. Dive deep into film details and help others discover great movies with your reviews.',
    },
    {
      'title': 'Start Watching Now',
      'image': ImageAssets.onboard5,
      'description': '',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          _buildPageView(),
          _buildBottomContainer(height, width),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: _pages.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return IntroWidget(
          description: _pages[index]['description'],
          image: _pages[index]['image'],
          title: _pages[index]['title'],
        );
      },
    );
  }

  Widget _buildBottomContainer(var height, var width) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.015),
        decoration: BoxDecoration(
          color: ColorManager.blackOn,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          spacing: 5,
          children: [
            SizedBox(height: height * 0.01),
            CustomText(
              text: _pages[selectIndex]['title'],
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            if (selectIndex < _pages.length - 1)
              CustomText(
                text: _pages[selectIndex]['description'],
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            SizedBox(height: height * 0.01),
            _buildActionButtons(height, width),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(var height, var width) {
    return Column(
      spacing: 10,
      children: [
        selectIndex < _pages.length - 1
            ? CustomButton(
                title: "Next",
                style: GoogleFonts.inter(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.blackOn),
                buttonColor: ColorManager.orange,
                textColor: ColorManager.blackOn,
                borderColor: ColorManager.blackOn,
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
              )
            : CustomButton(
                title: "Finish",
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.blackOn),
                buttonColor: ColorManager.orange,
                textColor: ColorManager.blackOn,
                borderColor: ColorManager.blackOn,
                onPressed: () {
                  navigateWithFade(context, LoginScreen());
                },
              ),
        if (selectIndex >= 1)
          CustomButton(
            title: "Back",
            style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ColorManager.orange),
            buttonColor: ColorManager.blackOn,
            textColor: ColorManager.orange,
            borderColor: ColorManager.orange,
            onPressed: () {
              _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
          )
      ],
    );
  }
}
