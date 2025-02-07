import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/customWidgets/custom_text_form_feild.dart';
import 'package:flutter_projects/core/resources/app_localizations.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';
import 'package:flutter_projects/features/auth/ui/reset_paswprd_screen/reset_password_screen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';


import '../../../../core/resources/asset_manager.dart';
import '../widgets/buid_divider.dart';
import '../widgets/build_text.dart';
import '../widgets/language_switcher_toggle.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  bool _obscureText = true;
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.03),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 7,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.splashLogo,
                  height: height * 0.27,
                ),
                CustomTextFormFeild(
                  style: FontManager.robotoRegular14White,
                  hintStyle: FontManager.robotoRegular14White,
                  validator: _validateEmail,
                  controller: emailController,
                  hint: 'email'.tr(context),
                  prefixIcon: Icon(
                    Icons.email,
                    color: ColorManager.primaryWhiteColor,
                    size: 30,
                  ),
                ),
                CustomTextFormFeild(
                  style: FontManager.robotoRegular14White,
                  hintStyle: FontManager.robotoRegular14White,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please Enter Password';
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: ColorManager.primaryWhiteColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  controller: passwordController,
                  hint: 'password'.tr(context),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: ColorManager.primaryWhiteColor,
                    size: 30,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      navigateWithFade(context, ResetPasswordScreen());
                    },
                    child: Text(
                      "forgot_password".tr(context),
                      style: FontManager.robotoRegular14Yellow,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomButton(
                  title: "login".tr(context),
                  buttonColor: ColorManager.yellowColor,
                  textColor: ColorManager.blackColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                buildtext(context, "Don't have an account?".tr(context), "create one".tr(context)),
                SizedBox(
                  height: height * 0.01,
                ),
                buildDivider(width, context),
                SizedBox(
                  height: height * 0.01,
                ),
                CustomButton(
                  icon: Svg(ImageAssets.googleIcon),
                  style: FontManager.robotoRegular16Black,
                  title: "login With google".tr(context),
                  buttonColor: ColorManager.yellowColor,
                  textColor: ColorManager.blackColor,
                ),
                SizedBox(
                  height: height * 0.02,
                  // child:
                ),
                LanguageSwitchToggle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Enter your email please';

    const pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    return RegExp(pattern).hasMatch(value) ? null : 'Invalid email';
  }
}
