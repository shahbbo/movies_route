import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/api/api_endPoints.dart';
import 'package:flutter_projects/core/helpers/local/cache_helper.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

import '../../../../core/resources/asset_manager.dart';
import '../../data/api/edit_profile_api.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit of(BuildContext context) => BlocProvider.of(context);
  EditProfileApi apiManager = EditProfileApi();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  String pickedAvatar = ImageAssets.profile1;

  String name = 'bebo';
  String phone = '01555173391';
  String egCode = '+2';

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

  void updateProfile() async {
    emit(EditProfileLoading());
    try {
      final response = await apiManager.updateData(ApiEndPoints.profile, {
        'name': nameController.text,
        'phone': egCode + phoneController.text,
        'avaterId': profileAvatars.indexOf(pickedAvatar),
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
