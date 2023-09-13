import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task/constants.dart';
import 'package:task/core/utilits/App_Route.dart';
import 'package:task/features/servers/persentation/view_model/_Fetch_server_cubit/fetch_server_cubit.dart';
import 'package:task/features/servers/persentation/views/AddServer.dart';
import 'package:task/features/servers/persentation/views/widght/server_info.dart';
import 'package:task/features/servers/persentation/views/widght/server_info_ListView.dart';

class ServerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: kprimaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddServerDialog();
                });
          }),
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Servers',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: kprimaryColor,
      ),
      body: Column(
        children: [Expanded(child: ServerInfoListView())],
      ),
    );
  }
}
