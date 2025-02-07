import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/customWidgets/error.dart';
import 'package:flutter_projects/data/api/login.dart';
import 'package:flutter_projects/data/model/login.dart';
import 'package:flutter_projects/data/repo/sources/repo/login_repo/login_repo_contract.dart';

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
