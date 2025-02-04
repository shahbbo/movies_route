import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';
import 'package:flutter_projects/features/auth/ui/widgets/language_switcher_toggle.dart';
import 'package:flutter_projects/core/resources/app_localizations.dart';

import '../../../../core/customWidgets/custom_button.dart';
import '../../../../core/customWidgets/custom_text_form_feild.dart';
import '../widgets/build_text.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final List<String> profileImages = [
    ImageAssets.profile1,
    ImageAssets.profile2,
    ImageAssets.profile3,
    ImageAssets.profile4,
    ImageAssets.profile5,
    ImageAssets.profile6,
    ImageAssets.profile7,
    ImageAssets.profile8,
    ImageAssets.profile9,
  ];

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController rePasswordController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  bool _obscureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        forceMaterialTransparency: true,
        iconTheme: IconThemeData(color: ColorManager.yellowColor),
        title: Text(
          'register'.tr(context),
          style: FontManager.robotoRegular16Yellow,
        ),
        backgroundColor: ColorManager.mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: profileImages.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Image.asset(
                    profileImages[index],
                  );
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 0.4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    CustomTextFormFeild(
                      controller: nameController,
                      prefixIcon: Icon(
                        Icons.person_pin_outlined,
                        color: ColorManager.primaryWhiteColor,
                        size: 30,
                      ),
                      hint: 'name'.tr(context),
                      hintStyle: FontManager.robotoRegular16White,
                      style: TextStyle(color: ColorManager.darkGray),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextFormFeild(
                      controller: emailController,
                      prefixIcon: Icon(
                        Icons.email,
                        color: ColorManager.primaryWhiteColor,
                        size: 30,
                      ),
                      hint: 'email'.tr(context),
                      hintStyle: FontManager.robotoRegular16White,
                      style: TextStyle(color: ColorManager.darkGray),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextFormFeild(
                      controller: passwordController,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: ColorManager.primaryWhiteColor,
                        size: 30,
                      ),
                      hint: 'password'.tr(context),
                      hintStyle: FontManager.robotoRegular16White,
                      style: TextStyle(color: ColorManager.darkGray),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: ColorManager.primaryWhiteColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextFormFeild(
                      controller: rePasswordController,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: ColorManager.primaryWhiteColor,
                        size: 30,
                      ),
                      hint: 'Confirm Password'.tr(context),
                      hintStyle: FontManager.robotoRegular16White,
                      style: TextStyle(color: ColorManager.darkGray),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: ColorManager.primaryWhiteColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextFormFeild(
                      controller: phoneNumberController,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: ColorManager.primaryWhiteColor,
                        size: 30,
                      ),
                      hint: 'phone'.tr(context),
                      hintStyle: FontManager.robotoRegular16White,
                      style: TextStyle(color: ColorManager.darkGray),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomButton(
                      title: 'Create Account'.tr(context),
                      onPressed: () {},
                      buttonColor: ColorManager.yellowColor,
                      textColor: ColorManager.blackColor,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    buildtext(context, "Already Have Account ? ".tr(context),
                        "login".tr(context)),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    LanguageSwitchToggle(),
                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
