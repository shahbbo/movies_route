import 'package:flutter/material.dart';
import 'package:flutter_projects/core/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/customWidgets/custom_text_form_feild.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';
import 'package:flutter_projects/features/auth/ui/login/login_switch_toggle.dart';

import '../../../../core/resources/asset_manager.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  bool _obscureText3 = true;
  final TextEditingController pass = TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  ImageAssets.splashLogo,
                  height: height * 0.27,
                ),
                CustomTextFormFeild(
                  style: FontManager.robotoRegular14White,
                  hintStyle: FontManager.robotoRegular14White,
                  validator: _validateEmail,
                  controller: email,
                  hint: "Email",
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
                  obscureText: _obscureText3,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText3 ? Icons.visibility_off : Icons.visibility,
                      color: ColorManager.primaryWhiteColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText3 = !_obscureText3;
                      });
                    },
                  ),
                  controller: pass,
                  hint: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: ColorManager.primaryWhiteColor,
                    size: 30,
                  ),
                ),
                InkWell(
                  child: Text(
                    textAlign: TextAlign.end,
                    "Forget Password ?",
                    style: FontManager.robotoRegular14Yellow,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomButton(
                  title: "Login",
                  buttonColor: ColorManager.yellowColor,
                  textColor: ColorManager.blackColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                _buildtext(),
                SizedBox(
                  height: height * 0.01,
                ),
                _buildDivider(width),
                SizedBox(
                  height: height * 0.01,
                ),
                CustomButton(
                  icon: AssetImage("assets/image/google_icon.png"),
                  style: FontManager.robotoRegular16Black,
                  title: "Login With Google",
                  buttonColor: ColorManager.yellowColor,
                  textColor: ColorManager.blackColor,
                ),
                SizedBox(
                  height: height * 0.05,
                  // child: LoginSwitchToggle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider(var width) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorManager.yellowColor,
            endIndent: width * 0.03,
            indent: width * 0.15,
          ),
        ),
        Text(
          textAlign: TextAlign.end,
          "OR",
          style: FontManager.robotoRegular14WhiteBlack,
        ),
        Expanded(
          child: Divider(
            color: ColorManager.yellowColor,
            endIndent: width * 0.15,
            indent: width * 0.03,
          ),
        ),
      ],
    );
  }

  Widget _buildtext() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.end,
          "Don’t Have Account ?",
          style: FontManager.robotoRegular14White,
        ),
        InkWell(
          child: Text(
            textAlign: TextAlign.end,
            " Create One",
            style: FontManager.robotoRegular14WhiteBlack,
          ),
        ),
      ],
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Enter your email please';

    const pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    return RegExp(pattern).hasMatch(value) ? null : 'Invalid email';
  }
}
