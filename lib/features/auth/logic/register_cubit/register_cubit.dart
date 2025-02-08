import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/helpers/local/cache_helper.dart';
import 'package:flutter_projects/features/auth/data/api/register_api%20.dart';
import 'package:flutter_projects/features/auth/data/model/registerDM.dart';

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

  Future<void> registerUser({required int selectedImage}) async {
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
          endpoint: 'auth/register', userData: userData);

      if (response.data != null) {
        print('User registered successfully');
        print(response.data);
        CacheHelper.saveData(key: 'Token', value: response.data?.id);
      }

      isLoading = false;
      emit(RegisterSuccess());
    } catch (e) {
      isLoading = false;
      print("Error: $e");
      emit(RegisterError(error: e.toString()));
    }
  }

  void registervalid(
      {required GlobalKey<FormState> formKey, required int selectedImage}) {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      registerUser(selectedImage: selectedImage);
    }
  }
}
