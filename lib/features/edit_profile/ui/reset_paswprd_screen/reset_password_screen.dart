import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/customWidgets/custom_text_form_feild.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

import 'package:flutter_projects/features/edit_profile/logic/change_password_cubit/change_password_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/customWidgets/custom_button.dart';
import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/text_manager.dart';
import '../../../../core/resources/toasts.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    //BlocProvider.of<ChangePasswordCubit>(context).loadOldPassword();
  }

  @override
  Widget build(BuildContext context) {
    final resetPassCubit = BlocProvider.of<ChangePasswordCubit>(context);
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
      if (state is ChangePasswordSuccess) {
        Toasts.success("Password Update Sucess", context);
        resetPassCubit.clearTextFields();
        Navigator.pop(context);
      } else if (state is ChangePasswordError) {
        if (state.errorMessage!.contains("Old password is incorrect")) {
          Toasts.error("The old password is incorrect", context);
        } else {
          Toasts.error(state.errorMessage!.join("\n"), context);
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          forceMaterialTransparency: true,
          iconTheme: IconThemeData(color: ColorManager.yellowColor),
          title:
              Text('Reset Password', style: FontManager.robotoRegular16Yellow),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset(ImageAssets.resetPass),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomTextFormFeild(
                          controller: resetPassCubit.oldPasswordController,
                          style: FontManager.robotoRegular14White,
                          prefixIcon: Icon(Icons.lock,
                              color: ColorManager.primaryWhiteColor, size: 30),
                          hint: 'Old Password',
                          hintStyle: FontManager.robotoRegular14White,
                          //readOnly: true,
                        ),
                        CustomTextFormFeild(
                          controller: resetPassCubit.newPasswordController,
                          style: FontManager.robotoRegular14White,
                          prefixIcon: Icon(Icons.lock,
                              color: ColorManager.primaryWhiteColor, size: 30),
                          hint: 'New Password',
                          hintStyle: FontManager.robotoRegular14White,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              resetPassCubit.resetPassword();
                            }
                            // navigateWithFade(context, LoginScreen());
                          },
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
        ),
      );
    });
  }
}
