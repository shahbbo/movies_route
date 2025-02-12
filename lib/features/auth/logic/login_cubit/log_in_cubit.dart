import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/components/components.dart';
import 'package:flutter_projects/core/helpers/local/cache_helper.dart';
import 'package:flutter_projects/features/app_layout/ui/pages/app_layout.dart';

import '../../data/repo/login_repo/login_repo_contract.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LoginRepoContract loginRepo;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  LogInCubit({required this.loginRepo}) : super(LoginInitial());
  static LogInCubit get(context) => BlocProvider.of(context);
  bool isloading = false;
  Future<void> loginUser({required context}) async {
    isloading = true;
    emit(LoginLoading());
    var result = await loginRepo.loginUser(
        pass: passwordController.text.trim(),
        email: emailController.text.trim());
    result.fold((error) {
      isloading = false;
      emit(LoginError(error: error.errorMessage));
    }, (token) {
      isloading = false;
      if (token.data != null) {
        print('Token in login cubit');
        print(token.data);
        CacheHelper.saveData(key: 'Token', value: token.data);
      }
      emit(LoginSucess());
      // Navigate to Home after successful login
      navigateWithFade(context, AppLayOut());
    });
  }

  void loginvalid(BuildContext context) {
    loginUser(context: context);
  }
}
