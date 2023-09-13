import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:task/constants.dart';
import 'package:task/core/utilits/failure.dart';

import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:task/features/servers/data/repos/servers_repo.dart';

class ServerRepoImpl implements ServersRepo {
  @override
  Future<Either<failure, void>> AddServer(AddServerModel addServerModel) async {
    try {
      var serverbox = Hive.box<AddServerModel>(kAddServerBox);
      var servers = await serverbox.add(addServerModel);
      return right(servers);
    } catch (e) {
      return left(failure(e.toString()));
    }
  }

  @override
  List<AddServerModel> FetchServers() {
    {
      var serverbox = Hive.box<AddServerModel>(kAddServerBox);
      List<AddServerModel> servers = serverbox.values.toList();

      return servers;
    }
  }

  // bool isValueUnique(List<AddServerModel> servers, String enteredValue) {
  //   FetchServers();
  //   for(var server in servers ){

  //   }
}
