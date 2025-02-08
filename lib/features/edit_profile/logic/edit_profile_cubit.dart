import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/api/api_endPoints.dart';
import 'package:flutter_projects/core/api/api_manager.dart';

import '../../../core/resources/asset_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../auth/ui/login_screen/login_screen.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

   ApiManager apiManager = ApiManager();
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

  void pickAvatarBottomSheet(BuildContext context ) {
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
                          pickedAvatar = profileAvatars[index];
                          emit(EditProfileSuccess('Avatar picked successfully.'));
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
