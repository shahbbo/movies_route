import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/edit_profile/data/api/reset_pass_api.dart';

import '../../../../core/helpers/local/cache_helper.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ResetPassApi resetPassApi;
  ChangePasswordCubit(this.resetPassApi) : super(ChangePasswordInitial());

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  void loadOldPassword() {
    String? oldPassword = CacheHelper.getData(key: 'pass');
    if (oldPassword != null && oldPassword.isNotEmpty) {
      oldPasswordController.text = oldPassword;
    } else {
      oldPasswordController.text = "";
    }
  }

  Future<void> resetPassword() async {
    emit(ChangePasswordLoading());

    try {
      if (oldPasswordController.text.isEmpty) {
        emit(ChangePasswordError(["Old password not found in cache"]));
        return;
      }

      final response = await resetPassApi.resetPassword(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
      );


      if (response.message == "Password updated successfully") {
        CacheHelper.saveData(key: 'pass', value: newPasswordController.text);
        oldPasswordController.text = newPasswordController.text;

        emit(ChangePasswordSuccess("Password updated successfully"));
      } else {
        emit(ChangePasswordError(response.errors ?? ["Unknown error"]));
      }
    } catch (e) {
      emit(ChangePasswordError(["An unexpected error occurred"]));
    }
  }

  void clearTextFields() {
    newPasswordController.clear();
  }
}
