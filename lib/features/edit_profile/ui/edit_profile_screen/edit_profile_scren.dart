import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/customWidgets/custom_text_form_feild.dart';
import 'package:flutter_projects/features/auth/ui/reset_paswprd_screen/reset_password_screen.dart';

import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/text_manager.dart';

class EditProfileScren extends StatefulWidget {
  const EditProfileScren({super.key});

  static const String routeName = 'edit_profile_screen';

  @override
  State<EditProfileScren> createState() => _EditProfileScrenState();
}

  class _EditProfileScrenState extends State<EditProfileScren> {
  final List<String>profileAvatars = [
    ImageAssets.profile1,
    ImageAssets.profile2,
    ImageAssets.profile3,
    ImageAssets.profile4,
    ImageAssets.profile5,
    ImageAssets.profile6,
    ImageAssets.profile7,
    ImageAssets.profile8,
    ImageAssets.profile9,
  ];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String pickedAvatar = ImageAssets.profile1;
  String name = 'bebo';
  String phone = '1234567890';
  @override
  Widget build(BuildContext context) {
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            children: [
              Image.asset(pickedAvatar,
                height: 100,
                width: 100,
              ),
              CustomTextFormFeild(
                controller: nameController,
                hint: name,
                hintStyle: FontManager.robotoRegular20WhiteBlack,
                prefixIcon: Icon(Icons.person, color: ColorManager.primaryWhiteColor,size: 30,),
              ),
              CustomTextFormFeild(
                controller: phoneController,
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
                  textColor: ColorManager.primaryWhiteColor,),
              CustomButton(
                  title: 'Update Profile',
                  buttonColor: ColorManager.yellowColor,
                  textColor: ColorManager.blackColor,),
            ],
          ),
        ),
      ),
    );
  }

void pickAvatarBottomSheet(BuildContext context ,) {
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
                itemCount: profileAvatars.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        pickedAvatar = profileAvatars[index];
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: pickedAvatar == profileAvatars[index] ? ColorManager.yellowColor.withOpacity(0.5) : null,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorManager.yellowColor,
                            width: 1,
                          ),
                        ),
                        child: Image.asset(
                          profileAvatars[index],
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