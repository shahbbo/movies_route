part of 'change_password_cubit.dart';

sealed class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final String successMessage;

  ChangePasswordSuccess(this.successMessage);
}

class ChangePasswordError extends ChangePasswordState {
  final String? errorMessage;

  ChangePasswordError(this.errorMessage);
}
