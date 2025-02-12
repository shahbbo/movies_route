import 'package:flutter/material.dart';
import 'package:flutter_projects/core/customWidgets/custom_text_form_feild.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/customWidgets/custom_button.dart';
import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/text_manager.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        forceMaterialTransparency: true,
        iconTheme: IconThemeData(color: ColorManager.yellowColor),
        title: Text('Reset Password', style: FontManager.robotoRegular16Yellow),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            children: [
              SvgPicture.asset(ImageAssets.resetPass),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextFormFeild(
                      controller: emailController,
                      prefixIcon: Icon(Icons.lock,
                          color: ColorManager.primaryWhiteColor, size: 30),
                      hint: 'Old Password',
                      hintStyle: FontManager.robotoRegular14White,
                    ),
                    CustomTextFormFeild(
                      controller: emailController,
                      prefixIcon: Icon(Icons.lock,
                          color: ColorManager.primaryWhiteColor, size: 30),
                      hint: 'New Password',
                      hintStyle: FontManager.robotoRegular14White,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      title: "Reset Password",
                      buttonColor: ColorManager.yellowColor,
                      textColor: ColorManager.blackColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
