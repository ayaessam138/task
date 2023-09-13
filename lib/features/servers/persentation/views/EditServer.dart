import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/constants.dart';
import 'package:task/core/utilits/CusstomButton.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:task/features/servers/persentation/view_model/_Fetch_server_cubit/fetch_server_cubit.dart';
import 'package:task/features/servers/persentation/views/widght/AddserverTextField.dart';
import 'package:task/features/servers/persentation/views/widght/DeafultServer_check.dart';

import '../../../../core/utilits/Dialog.dart';

class EditServerView extends StatefulWidget {
  final String title;
  final AddServerModel addServerModel;

  EditServerView(
      {super.key, required this.title, required this.addServerModel});

  @override
  State<EditServerView> createState() => _EditServerViewState();
}

class _EditServerViewState extends State<EditServerView> {
  TextEditingController servername = TextEditingController();

  TextEditingController serverIp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      titlePadding: EdgeInsets.zero,
      title: DialogTitle(title: widget.title),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AddServerTextField(
                labeltext: 'serverNmae',
                prefixicon: FontAwesomeIcons.database,
                controller: servername,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '';
                  }
                  for (var element
                      in BlocProvider.of<FetchServerCubit>(context).servers) {
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
                controller: serverIp,
              ),
              DefaultServerCheck(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContanier(
                      onTap: () {
                        widget.addServerModel.ServerName = servername.text;
                        widget.addServerModel.ServerIP = serverIp.text;
                        widget.addServerModel.save();
                        BlocProvider.of<FetchServerCubit>(context)
                            .fetchServer();
                        Navigator.pop(context);
                      },
                      text: 'Save'),
                  CustomContanier(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      text: 'Cancel')
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
