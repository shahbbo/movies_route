import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/helpers/local/cache_helper.dart';

import '../../data/repo/sources/repo/login_repo/login_repo_contract.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LoginRepoContract loginRepo;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey();
  LogInCubit({required this.loginRepo}) : super(LoginInitial());
  static LogInCubit get(context) => BlocProvider.of(context);
  bool isloading = false;
  Future<void> loginUser() async {
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
        CacheHelper.saveData(key:'Token', value: token.data);
      }
      emit(LoginSucess());
    });
  }

  void loginvalid() {
    if (loginKey.currentState!.validate()) {
      loginUser();
    }
  }
}
