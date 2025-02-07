part of 'log_in_cubit.dart';

abstract class LogInState {}

class LoginInitial extends LogInState {}

class LoginLoading extends LogInState {}

class LoginSucess extends LogInState {}

class LoginError extends LogInState {
  final String error;
  LoginError({required this.error});
}
