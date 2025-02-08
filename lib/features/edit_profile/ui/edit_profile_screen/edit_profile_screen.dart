import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/api/api_manager.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/customWidgets/custom_text_form_feild.dart';
import 'package:flutter_projects/core/resources/dialog_utils.dart';
import 'package:flutter_projects/features/auth/ui/reset_paswprd_screen/reset_password_screen.dart';

import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/text_manager.dart';
import '../../logic/edit_profile_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static const String routeName = 'edit_profile_screen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

  class _EditProfileScreenState extends State<EditProfileScreen> {
    EditProfileCubit viewModel = EditProfileCubit();

  String name = 'bebo';
  String phone = '1234567890';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>viewModel,
      child: BlocListener<EditProfileCubit,EditProfileState>(
        listener: (context, state) {
          if(state is EditProfileLoading){
            DialogUtils.showLoading(context, message: 'Loading...');
          }else if(state is EditProfileError){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, message: 'Error',posActionName: 'Ok');
          }else if(state is EditProfileSuccess){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, message: 'Success',posActionName: 'Ok');
          }
        },
        child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            forceMaterialTransparency: true,
            iconTheme: IconThemeData(color: ColorManager.yellowColor),
            title: TextButton(
              onPressed: () {
                viewModel.pickAvatarBottomSheet(context);
              },
              child: Text(
                'Pick Avatar',
                style: FontManager.robotoRegular16Yellow,
              ),
            ),
            backgroundColor: ColorManager.mainColor,
            centerTitle: true,
          ),
          body: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 20,
                children: [
                  Image.asset(viewModel.pickedAvatar,
                    height: 100,
                    width: 100,
                  ),
                  CustomTextFormFeild(
                    controller: viewModel.nameController,
                    hint: name,
                    hintStyle: FontManager.robotoRegular20WhiteBlack,
                    prefixIcon: Icon(Icons.person, color: ColorManager.primaryWhiteColor,size: 30,),
                  ),
                  CustomTextFormFeild(
                    controller: viewModel.phoneController,
                    hint: phone,
                    hintStyle: FontManager.robotoRegular20WhiteBlack,
                    prefixIcon: Icon(Icons.local_phone, color: ColorManager.primaryWhiteColor,size: 30,),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: (){
                          navigateWithFade(context, ResetPasswordScreen());
                        },
                        child: Text(
                          'Reset Password',
                          style: FontManager.interMedium36White.copyWith(
                            fontSize: 20,
                          ),
                        ),),
                  ),
                  Spacer(),
                  CustomButton(
                      title: 'Delete Account',
                      buttonColor: ColorManager.redColor,
                      textColor: ColorManager.primaryWhiteColor,
                    onPressed: (){

                      viewModel.deleteAccount(context);
                    },
                  ),
                  CustomButton(
                      title: 'Update Data',
                      buttonColor: ColorManager.yellowColor,
                      textColor: ColorManager.blackColor,
                    onPressed: (){
                        viewModel.updateProfile(viewModel.nameController.text, viewModel.phoneController.text);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}