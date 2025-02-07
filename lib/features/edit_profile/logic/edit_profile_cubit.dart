import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/api/api_endPoints.dart';
import 'package:flutter_projects/core/api/api_manager.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/helpers/local/cache_helper.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/toasts.dart';

import '../../auth/ui/login_screen/login_screen.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  ApiManager apiManager = ApiManager();

  void deleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorManager.grey,
          title: Text('Delete Account'),
          content: Text(
              'Are you sure you want to delete your account?\nThis action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                emit(DeleteAccountLoading());
                await performDeleteAccount(context);
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Future<void> performDeleteAccount(BuildContext context) async {
    try {
      final response = await apiManager.deleteAccount(ApiEndPoints.profile);
      if (response['success'] == true) {
        emit(DeleteAccountSuccess(response['message']));
        CacheHelper.clearData(key: 'Token');
      } else {
        emit(DeleteAccountError(
            'Failed to delete account: ${response['message']}'));
      }
    } catch (e) {
      emit(DeleteAccountError('Error deleting account. Please try again.'));
    }
  }

  void updateProfile(String name, String phone, avatarId) async {
    emit(EditProfileLoading());
    try {
      print('name: $name, phone: $phone, avatarId: $avatarId');
      final response = await apiManager.updateData(ApiEndPoints.profile, {
        'name': name,
        'phone': phone,
        'avaterId': avatarId,
      });
      if (response['success'] == true) {
        print('response: ${response['message']}');
        emit(EditProfileSuccess(response['message']));
      } else {
        print('response: ${response['message']}');
        emit(EditProfileError(
            'Failed to update profile: ${response['message']}'));
      }
    } catch (e) {
      emit(EditProfileError('Error updating profile. Please try again.'));
    }
  }
}
