import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/customWidgets/custom_text_form_feild.dart';
import 'package:flutter_projects/core/resources/app_localizations.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';
import 'package:flutter_projects/core/resources/toasts.dart';
import 'package:flutter_projects/core/resources/validate_of_textfiled.dart';
import 'package:flutter_projects/features/app_layout/ui/pages/app_layout.dart';
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

  @override
  Widget build(BuildContext context) {
    var loginCubit = context.read<LogInCubit>();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LoginError) {
          Toasts.error(state.error, context);
        }
        if (state is LoginSucess) {
          Toasts.success("Login Sucess", context);
          navigateWithFade(context, AppLayOut());
        }
        if (state is LoginLoading) {}
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.03),
            child: SingleChildScrollView(
              child: Form(
                key: loginCubit.loginKey,
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
                      validator: ValidateOfTextfiled.validateEmail,
                      controller: loginCubit.emailController,
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
                      validator: (text) =>
                          ValidateOfTextfiled.validatePassword(text),
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
                      controller: loginCubit.passwordController,
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
                        loginCubit.loginvalid();
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
}
