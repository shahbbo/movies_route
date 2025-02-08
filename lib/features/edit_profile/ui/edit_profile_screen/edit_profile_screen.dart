import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/customWidgets/custom_text_form_feild.dart';
import 'package:flutter_projects/core/resources/toasts.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/text_manager.dart';
import '../../../auth/ui/login_screen/login_screen.dart';
import '../../logic/edit_profile_cubit/edit_profile_cubit.dart';
import '../reset_paswprd_screen/reset_password_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static const String routeName = 'edit_profile_screen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

  class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<EditProfileCubit,EditProfileState>(
      listener: (context, state) {
        if(state is DeleteAccountSuccess){
          Toasts.success(state.successMessage,context);
          navigateWithFade(context, LoginScreen());
        }else if(state is DeleteAccountError){
          Toasts.error(state.errorMessage,context);
        } else if(state is EditProfileSuccess){
          Toasts.success(state.successMessage,context);
        }else if(state is EditProfileError){
          Toasts.error(state.errorMessage,context);
        }
      },
      builder: (BuildContext context,  state) {
        final editProfileCubit = EditProfileCubit.of(context);
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            forceMaterialTransparency: true,
            iconTheme: IconThemeData(color: ColorManager.yellowColor),
            title: TextButton(
              onPressed: () {
                pickAvatarBottomSheet(context);
              },
              child: Text(
                'Pick Avatar',
                style: FontManager.robotoRegular16Yellow,
              ),
            ),
            backgroundColor: ColorManager.mainColor,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: editProfileCubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 20,
                  children: [
                    Image.asset(editProfileCubit.pickedAvatar,
                      height: 100,
                      width: 100,
                    ),
                    CustomTextFormFeild(
                      controller: editProfileCubit.nameController,
                      hint: editProfileCubit.name,
                      style: FontManager.robotoRegular20WhiteBlack,
                      hintStyle: FontManager.robotoRegular20WhiteBlack,
                      prefixIcon: Icon(Icons.person, color: ColorManager.primaryWhiteColor,size: 30,),
                    ),
                    CustomTextFormFeild(
                      controller: editProfileCubit.phoneController,
                      hint: editProfileCubit.phone,
                      style: FontManager.robotoRegular20WhiteBlack,
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
                    SizedBox(
                      height: size.height * 0.18,
                    ),
                    CustomButton(
                      title: 'Delete Account',
                      buttonColor: ColorManager.redColor,
                      textColor: ColorManager.primaryWhiteColor,
                      onPressed: (){
                        editProfileCubit.deleteAccount(context);
                      },
                    ),
                    CustomButton(
                      title: 'Update Data',
                      buttonColor: ColorManager.yellowColor,
                      textColor: ColorManager.blackColor,
                      onPressed: (){
                        editProfileCubit.updateProfile();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

void pickAvatarBottomSheet(BuildContext context ) {
    final editProfileCubit = EditProfileCubit.of(context);
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        color: ColorManager.mainColor.withOpacity(0.9),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: editProfileCubit.profileAvatars.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        editProfileCubit.pickedAvatar = editProfileCubit.profileAvatars[index];
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: editProfileCubit.pickedAvatar == editProfileCubit.profileAvatars[index] ? ColorManager.yellowColor.withOpacity(0.5) : null,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorManager.yellowColor,
                            width: 1,
                          ),
                        ),
                        child: Image.asset(
                          editProfileCubit.profileAvatars[index],
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
}