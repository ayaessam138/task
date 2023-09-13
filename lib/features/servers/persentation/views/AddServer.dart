import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/constants.dart';
import 'package:task/core/utilits/CusstomButton.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:task/features/servers/persentation/view_model/_Fetch_server_cubit/fetch_server_cubit.dart';
import 'package:task/features/servers/persentation/view_model/add_server_cubit/add_server_cubit.dart';
import 'package:task/features/servers/persentation/views/EditServer.dart';
import 'package:task/features/servers/persentation/views/widght/AddserverTextField.dart';
import 'package:task/features/servers/persentation/views/widght/DeafultServer_check.dart';

import '../../../../core/utilits/Dialog.dart';

class AddServerView extends StatefulWidget {
  final String title;

  AddServerView({super.key, required this.title});

  @override
  State<AddServerView> createState() => _AddServerViewState();
}

class _AddServerViewState extends State<AddServerView> {
  TextEditingController ServerName = TextEditingController();

  TextEditingController ServerIP = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title: DialogTitle(title: widget.title),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  AddServerTextField(
                    labeltext: 'serverNmae',
                    prefixicon: FontAwesomeIcons.database,
                    controller: ServerName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      for (var element
                          in BlocProvider.of<FetchServerCubit>(context)
                              .servers) {
                        if (element.ServerName == value) {
                          return 'Name Must be Unique';
                        }
                      }

                      return null;
                    },
                  ),
                  AddServerTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    labeltext: 'ServerIP/Domain',
                    prefixicon: Icons.insert_link,
                    controller: ServerIP,
                  ),
                  DefaultServerCheck(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomContanier(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              var addservermodel = AddServerModel(
                                ServerName: ServerName.text,
                                ServerIP: ServerIP.text,
                                DeafultServer:
                                    BlocProvider.of<AddServerCubit>(context)
                                        .checkBoxValue,
                              );
                              BlocProvider.of<AddServerCubit>(context)
                                  .AddServer(addservermodel);
                              BlocProvider.of<FetchServerCubit>(context)
                                  .fetchServer();
                            }
                          },
                          text: 'Save'),
                      CustomContanier(
                        text: 'Cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AddServerDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddServerCubit, AddServerState>(
        builder: (context, state) {
      return AddServerView(title: 'Add SeRver');
    }, listener: (context, state) {
      if (state is AddServerLoading) {
        Center(child: CircularProgressIndicator());
      }
      if (state is AddServersucess) {
        // BlocProvider.of<FetchServerCubit>(context).fetchServer();
        Navigator.pop(context);
      }
      if (state is AddServerfailure) {
        state.ErrorMessage;
      }
    });
  }
}
