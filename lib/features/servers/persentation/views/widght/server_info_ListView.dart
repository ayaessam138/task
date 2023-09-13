import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:task/features/servers/persentation/view_model/_Fetch_server_cubit/fetch_server_cubit.dart';
import 'package:task/features/servers/persentation/views/widght/server_info.dart';

class ServerInfoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchServerCubit, FetchServerState>(
      builder: (context, state) {
        List<AddServerModel> serverlist =
            BlocProvider.of<FetchServerCubit>(context).servers ?? [];
        return ListView.builder(
          itemCount: serverlist.length,
          itemBuilder: (context, index) {
            return ServerInfo(
              addServerModel: serverlist[index],
            );
          },
        );
      },
    );
  }
}
