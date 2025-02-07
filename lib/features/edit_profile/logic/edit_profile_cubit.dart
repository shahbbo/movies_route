import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/api/api_endPoints.dart';
import 'package:flutter_projects/core/api/api_manager.dart';

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
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account?\nThis action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                emit(EditProfileLoading());
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account deleted successfully')),
        );
        emit(EditProfileSuccess('Account deleted successfully.'));
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete account: ${response['message']}')),
        );
        emit(EditProfileError('Failed to delete account: ${response['message']}'));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting account. Please try again.')),
      );
      emit(EditProfileError('Error deleting account. Please try again.'));
    }
  }

  void updateProfile(String name, String phone) async {
    emit(EditProfileLoading());

    try {
      final response = await apiManager.updateData(ApiEndPoints.profile, {
        'name': name,
        'phone': phone,
      });

      if (response['success'] == true) {
        emit(EditProfileSuccess('Profile updated successfully.'));
      } else {
        emit(EditProfileError('Failed to update profile: ${response['message']}'));
      }
    } catch (e) {
      emit(EditProfileError('Error updating profile. Please try again.'));
    }
  }

}
