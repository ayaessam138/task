import 'package:dartz/dartz.dart';
import 'package:task/features/Login/data/repos/login_repo.dart';

import '../../../../core/utilits/failure.dart';
import '../../../../core/utilits/api.dart';

class LoginRepoImpl implements LoginRepo {
  LoginRepoImpl(this.api);
  final Api api;
  @override
  Future<Either<failure, dynamic>> login(
      {required Map<String, dynamic> body}) async {
    try {
      final result = await api.post(
        endpoint: '/api/Authentication/login',
        body: body,
      );
      return Right(result);
    } catch (e) {
      return Left(
        failure(e.toString()),
      );
    }
  }
}
