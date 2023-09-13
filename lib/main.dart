import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:task/constants.dart';
import 'package:task/core/utilits/App_Route.dart';
import 'package:task/core/utilits/bloc_oberver.dart';
import 'package:task/core/utilits/api.dart';
import 'package:task/core/utilits/nvaigation/cubit/navigation_cubit.dart';
import 'package:task/core/utilits/service_Locator.dart';
import 'package:task/features/Login/data/repos/login_repo_impl.dart';
import 'package:task/features/Login/persentation/view_model/FingerprintAuth/cubit/fingerprint_auth_cubit.dart';
import 'package:task/features/Login/persentation/view_model/cubit/login_cubit.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:task/features/servers/data/repos/server_repo_impl.dart';
import 'package:task/features/servers/data/repos/servers_repo.dart';
import 'package:task/features/servers/persentation/view_model/_Fetch_server_cubit/fetch_server_cubit.dart';
import 'package:task/features/servers/persentation/view_model/add_server_cubit/add_server_cubit.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(AddServerModelAdapter());
  await Hive.openBox<AddServerModel>(kAddServerBox);
  await Hive.openBox('box');

  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => AddServerCubit(getIt.get<ServerRepoImpl>()),
        ),
        BlocProvider(
            create: (context) => FetchServerCubit(
                  (getIt.get<ServerRepoImpl>()),
                )..fetchServer()),
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<LoginRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => FingerprintAuthCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
