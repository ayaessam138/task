import 'package:task/core/utilits/failure.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:dartz/dartz.dart';

abstract class ServersRepo {
  Future<Either<failure, void>> AddServer(AddServerModel addServerModel);
  List<AddServerModel> FetchServers();
}
