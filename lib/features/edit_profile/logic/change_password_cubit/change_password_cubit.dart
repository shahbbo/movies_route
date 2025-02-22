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

  Future<void> resetPassword() async {
    emit(ChangePasswordLoading());

    try {
      String? token = CacheHelper.getData(key: 'Token');
      if (token == null || token.isEmpty) {
        emit(ChangePasswordError(["Token not found"]));
        return;
      }

      if (oldPasswordController.text.isEmpty) {
        emit(ChangePasswordError(["Old password is required"]));
        return;
      }

      if (newPasswordController.text.isEmpty) {
        emit(ChangePasswordError(["New password is required"]));
        return;
      }

      final response = await resetPassApi.resetPassword(
        token: token,
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
      );

      if (response.message == "Password updated successfully") {
        emit(ChangePasswordSuccess("Password updated successfully"));
      } else {
        emit(ChangePasswordError(response.errors));
      }
    } catch (e) {
      emit(ChangePasswordError(["An unexpected error occurred"]));
    }
  }

  void clearTextFields() {
    newPasswordController.clear();
    oldPasswordController.clear();
  }
}
