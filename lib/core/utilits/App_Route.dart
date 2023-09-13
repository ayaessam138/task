import 'package:go_router/go_router.dart';
import 'package:task/core/utilits/bio_metric.dart';
import 'package:task/features/Login/persentation/views/Login_View.dart';

import 'package:task/core/utilits/nvaigation/Navigation.dart';
import 'package:task/features/servers/persentation/views/AddServer.dart';
import 'package:task/features/servers/persentation/views/server_view.dart';
import 'package:task/features/spalsh/persentation/views/splash_view.dart';

abstract class AppRoutes {
  static const kLoginView = '/LoginView';
  static const kNavigation = '/Navigation';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => SplashView()),
    GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
    GoRoute(path: kNavigation, builder: (context, state) => Navigation()),
  ]);
}
