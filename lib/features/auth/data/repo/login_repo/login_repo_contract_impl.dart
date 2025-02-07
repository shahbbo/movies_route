import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/customWidgets/error.dart';

import '../../api/login_api.dart';
import '../../model/login.dart';
import 'login_repo_contract.dart';

class LoginRepoContractImpl implements LoginRepoContract {
  final ApiService api;

  LoginRepoContractImpl(this.api);
  @override
  Future<Either<Failures, UserLogin>> loginUser({
    required String pass,
    required String email,
  }) async {
    try {
      var response = await api.loginn(
        endpoint: 'auth/login',
        data: {'email': email, 'password': pass},
      );
      return Right(UserLogin.fromJson(response));
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
