import 'package:flutter/material.dart';
import 'package:task/constants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utilits/nvaigation/cubit/navigation_cubit.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
            body: BlocProvider.of<NavigationCubit>(context).Screens[
                BlocProvider.of<NavigationCubit>(context).currentindex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: kprimaryColor,
              unselectedItemColor: Colors.grey,
              currentIndex:
                  BlocProvider.of<NavigationCubit>(context).currentindex,
              items: BlocProvider.of<NavigationCubit>(context).ITEMS,
              onTap: (index) {
                BlocProvider.of<NavigationCubit>(context).pagenavgation(index);
              },
            ));
      },
    );
  }
}
