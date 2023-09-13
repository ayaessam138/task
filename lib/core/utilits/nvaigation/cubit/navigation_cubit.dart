import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';
import 'package:task/constants.dart';
import 'package:task/features/Login/persentation/views/Login_View.dart';

import 'package:task/features/servers/persentation/views/server_view.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  int currentindex = 0;

  List<BottomNavigationBarItem> ITEMS = [
    const BottomNavigationBarItem(
      label: 'Login',
      icon: Icon(
        Icons.person,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Servers',
      icon: Icon(FontAwesomeIcons.database),
    ),
  ];

  List<Widget> Screens = [LoginView(), ServerView()];
  List<String> apppartitle = [
    'Login',
    'Servers',
  ];
  void pagenavgation(int index) {
    currentindex = index;
    emit(NavigationInitial());
  }
}
