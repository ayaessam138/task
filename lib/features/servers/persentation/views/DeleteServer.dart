import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utilits/Dialog.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:task/features/servers/persentation/view_model/_Fetch_server_cubit/fetch_server_cubit.dart';

class DelteServerView extends StatelessWidget {
  final AddServerModel addServerModel;

  const DelteServerView({super.key, required this.addServerModel});
  @override
  Widget build(BuildContext context) {
    return DialogWithTwoButton(
      title: 'Delete Server',
      content: 'Are your sure you want to delete this selected server?',
      button1Text: 'Delete',
      button2Text: 'Cancel',
      addServerModel: addServerModel,
      onTap1: () {
        addServerModel.delete();
        BlocProvider.of<FetchServerCubit>(context).fetchServer();
        Navigator.pop(context);
      },
      onTap2: () {
        Navigator.pop(context);
      },
    );
  }
}
