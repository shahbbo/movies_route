import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/api/api_endPoints.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/helpers/local/cache_helper.dart';
import 'package:flutter_projects/features/app_layout/ui/pages/app_layout.dart';
import 'package:flutter_projects/features/auth/data/api/register_api%20.dart';
import 'package:flutter_projects/features/auth/data/model/registerDM.dart';

import '../login_cubit/log_in_cubit.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterApiService apiService;

  // Initialize controllers inside the constructor
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController repasswordController;
  late final TextEditingController nameController;
  late final TextEditingController phoneController;

  // GlobalKey<FormState> registerKey = GlobalKey();
  bool isLoading = false;

  RegisterCubit({required this.apiService}) : super(RegisterInitial()) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> registerUser(
      {required int selectedImage,
      required LogInCubit loginCubit,
      required BuildContext context}) async {
    isLoading = true;
    emit(RegisterLoading());

    try {
      Data userData = Data(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: repasswordController.text.trim(),
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        avaterId: selectedImage,
      );
      // Debugging Step: Print request body
      print("Request Body: ${jsonEncode(userData.toJson())}");

      User response = await apiService.register(
          endpoint: ApiEndPoints.register, userData: userData);
      if (response.data != null) {
        print('User registered successfully');
        print(response.data);
      }
      isLoading = false;
      emit(RegisterSuccess());
      loginCubit.emailController.text = emailController.text.trim();
      loginCubit.passwordController.text = passwordController.text.trim();
      await loginCubit.loginUser(context: context);
    } catch (e) {
      isLoading = false;
      print("Error: $e");
      emit(RegisterError(error: e.toString()));
    }
  }

  void registervalid(
      {required GlobalKey<FormState> formKey,
      required int selectedImage,
      required LogInCubit loginCubit,
      required BuildContext context}) {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      registerUser(
          selectedImage: selectedImage,
          loginCubit: loginCubit,
          context: context);
    }
  }
}
