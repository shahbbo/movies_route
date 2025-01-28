
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';

import '../core/components/customWidgets/custom_text_form_feild.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register_screen';

  List<String>profileImages = [
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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Register',
          style: FontManager.robotoRegular16Yellow,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: profileImages.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Image.asset(profileImages[index],);
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 0.4,

                ),
              ),
              CustomTextFormFeild(
                controller: null,
                prefixIcon: Image.asset(ImageAssets.nameIcon),
                hint: 'Name',
                hintStyle:FontManager.robotoRegular16White ,
                style: TextStyle(color: ColorManager.darkGray),
              ),
              SizedBox(height: height*0.02,),
              CustomTextFormFeild(
                controller: null,
                prefixIcon: Image.asset(ImageAssets.emailIcon),
                hint: 'Email',
                hintStyle:FontManager.robotoRegular16White ,
                style: TextStyle(color: ColorManager.darkGray),
              ),
              SizedBox(height: height*0.02,),
              CustomTextFormFeild(
                controller: null,
                prefixIcon: Image.asset(ImageAssets.passIcon),
                hint: 'Password',
                hintStyle:FontManager.robotoRegular16White ,
                style: TextStyle(color: ColorManager.darkGray),
                suffixIcon: Image.asset(ImageAssets.eyeOffIcon),

              ),
              SizedBox(height: height*0.02,),
              CustomTextFormFeild(
                controller: null,
                prefixIcon: Image.asset(ImageAssets.passIcon),
                hint: 'Confirm Password',
                hintStyle:FontManager.robotoRegular16White ,
                style: TextStyle(color: ColorManager.darkGray),
                suffixIcon: Image.asset(ImageAssets.eyeOffIcon),
              ),
              SizedBox(height: height*0.02,),
              CustomTextFormFeild(
                controller: null,
                prefixIcon: Image.asset(ImageAssets.phoneIcon),
                hint: 'Phone Number',
                hintStyle:FontManager.robotoRegular16White ,
                style: TextStyle(color: ColorManager.darkGray),
              ),
              SizedBox(height: height*0.02,),
              CustomButton(
                  title: 'Create Account',
                  buttonColor: ColorManager.yellowColor,
                  textColor: ColorManager.blackColor,
              ),
              SizedBox(height: height*0.02,),
              Text.rich(TextSpan(
                children: [
                  TextSpan(text: 'Already Have Account ? ',
                  style: FontManager.robotoRegular14White),
                  TextSpan(text: 'Login',style: FontManager.robotoBlack14Yellow)
                ]
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
