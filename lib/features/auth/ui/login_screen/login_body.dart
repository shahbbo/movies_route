import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/customWidgets/custom_text_form_feild.dart';
import 'package:flutter_projects/core/resources/app_localizations.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';
import 'package:flutter_projects/features/auth/logic/login_cubit/log_in_cubit.dart';
import 'package:flutter_projects/features/auth/ui/reset_paswprd_screen/reset_password_screen.dart';
import 'package:flutter_projects/features/auth/ui/widgets/buid_divider.dart';
import 'package:flutter_projects/features/auth/ui/widgets/build_text.dart';
import 'package:flutter_projects/features/auth/ui/widgets/language_switcher_toggle.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var c = context.read<LogInCubit>();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LoginError) {
          print("errorrrrrrr");
        }
        if (state is LoginSucess) {
          print("sucesssss");
        }
        if (state is LoginLoading) {
          print("loading");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.03),
            child: SingleChildScrollView(
              child: Form(
                key: c.loginKey,
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
                      controller: c.emailController,
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
                      controller: c.passwordController,
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
                      isLoading: state is LoginLoading,
                      onPressed: () {
                        c.loginvalid();
                      },
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    buildtext(context, "Don't have an account?".tr(context),
                        "create one".tr(context)),
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
      },
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Enter your email please';

    const pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    return RegExp(pattern).hasMatch(value) ? null : 'Invalid email';
  }
}
