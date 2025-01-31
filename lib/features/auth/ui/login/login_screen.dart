import 'package:flutter/material.dart';
import 'package:flutter_projects/core/customWidgets/custom_text_form_feild.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

import '../../../../core/resources/asset_manager.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.015),
        child: Column(
          children: [
            Image.asset(ImageAssets.splashLogo),
            CustomTextFormFeild(
              controller: email,
              hint: "Email",
              prefixIcon: Icon(
                Icons.email,
                color: ColorManager.primaryWhiteColor,
                size: 30,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextFormFeild(
              controller: pass,
              hint: "Password",
              prefixIcon: Icon(
                Icons.lock,
                color: ColorManager.primaryWhiteColor,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
