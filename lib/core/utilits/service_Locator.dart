import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/core/utilits/api.dart';
import 'package:task/features/Login/data/repos/login_repo_impl.dart';
import 'package:task/features/servers/data/repos/server_repo_impl.dart';
import 'package:task/features/servers/data/repos/servers_repo.dart';

final getIt = GetIt.instance;
void serviceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<Api>(Api(Dio()));
  getIt.registerSingleton<ServerRepoImpl>(ServerRepoImpl());
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(getIt.get<Api>()));
}
