import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/components/components.dart';

import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';
import 'package:flutter_projects/core/resources/toasts.dart';
import 'package:flutter_projects/core/resources/validate_of_textfiled.dart';
import 'package:flutter_projects/features/app_layout/ui/pages/app_layout.dart';
import 'package:flutter_projects/features/auth/logic/login_cubit/log_in_cubit.dart';
import 'package:flutter_projects/features/auth/logic/register_cubit/register_cubit.dart';
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
  @override
  Widget build(BuildContext context) {
    // seleImage = profileImages[currentIndex];

    var height = MediaQuery.of(context).size.height;
    var regCubit = context.read<RegisterCubit>();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          Toasts.error(state.error, context);
        }
        if (state is RegisterSuccess) {
          Toasts.success("Register Sucess", context);
          navigateWithFade(context, AppLayOut());
        }
        if (state is RegisterLoading) {}
      },
      builder: (context, state) {
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
                key: regCubit.fformKey,
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: regCubit.profileImages.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              regCubit.currentIndex = index;
                              regCubit.seleImage =
                                  regCubit.profileImages[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  regCubit.profileImages[index],
                                ),
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: regCubit.currentIndex == index
                                    ? ColorManager.yellowColor
                                    : Colors.transparent,
                                width: 8,
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: height * 0.18,
                        enlargeCenterPage: true,
                        viewportFraction: 0.36,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 17, right: 17, top: 10),
                      child: Column(
                        children: [
                          CustomTextFormFeild(
                            controller: regCubit.nameController,
                            validator: (val) =>
                                ValidateOfTextfiled.validateFullName(val),
                            style: FontManager.robotoRegular14White,
                            hintStyle: FontManager.robotoRegular14White,
                            prefixIcon: Icon(
                              Icons.person_pin_outlined,
                              color: ColorManager.primaryWhiteColor,
                              size: 30,
                            ),
                            hint: 'name'.tr(context),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormFeild(
                            style: FontManager.robotoRegular14White,
                            hintStyle: FontManager.robotoRegular14White,
                            // validator: _validateEmail,
                            controller: regCubit.emailController,
                            validator: (val) =>
                                ValidateOfTextfiled.validateEmail(val),
                            hint: 'email'.tr(context),
                            prefixIcon: Icon(
                              Icons.email,
                              color: ColorManager.primaryWhiteColor,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormFeild(
                            controller: regCubit.passwordController,
                            style: FontManager.robotoRegular14White,
                            hintStyle: FontManager.robotoRegular14White,
                            validator: (val) =>
                                ValidateOfTextfiled.validatePassword(val),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: ColorManager.primaryWhiteColor,
                              size: 30,
                            ),
                            hint: 'password'.tr(context),
                            obscureText: regCubit.obscureText1,
                            suffixIcon: IconButton(
                              icon: Icon(
                                regCubit.obscureText1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ColorManager.primaryWhiteColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  regCubit.obscureText1 =
                                      !regCubit.obscureText1;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormFeild(
                            controller: regCubit.repasswordController,
                            style: FontManager.robotoRegular14White,
                            hintStyle: FontManager.robotoRegular14White,
                            validator: (val) =>
                                ValidateOfTextfiled.validateConfirmPassword(
                              val,
                              regCubit.passwordController.text,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: ColorManager.primaryWhiteColor,
                              size: 30,
                            ),
                            hint: 'Confirm Password'.tr(context),
                            obscureText: regCubit.obscureText2,
                            suffixIcon: IconButton(
                              icon: Icon(
                                regCubit.obscureText2
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ColorManager.primaryWhiteColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  regCubit.obscureText2 =
                                      !regCubit.obscureText2;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormFeild(
                            controller: regCubit.phoneController,
                            validator: (val) =>
                                ValidateOfTextfiled.validatePhoneNumber(val),
                            style: FontManager.robotoRegular14White,
                            hintStyle: FontManager.robotoRegular14White,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: ColorManager.primaryWhiteColor,
                              size: 30,
                            ),
                            hint: 'phone'.tr(context),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomButton(
                            title: 'Create Account',
                            buttonColor: ColorManager.yellowColor,
                            textColor: ColorManager.blackColor,
                            isLoading: state is RegisterLoading,
                            onPressed: () {
                              print(regCubit.currentIndex);
                              regCubit.registervalid(
                                  context: context,
                                  formKey: regCubit.fformKey,
                                  loginCubit: context.read<LogInCubit>(),
                                  selectedImage: regCubit.currentIndex);
                            },
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          buildtext(
                              context,
                              "Already Have Account ? ".tr(context),
                              "login".tr(context)),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          LanguageSwitchToggle(),
                          SizedBox(
                            height: height * 0.02,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
