part of 'fetch_server_cubit.dart';

@immutable
sealed class FetchServerState {}

final class FetchServerInitial extends FetchServerState {}

final class FetchServersucess extends FetchServerState {
  List<AddServerModel> serverList;
  FetchServersucess(this.serverList);
}
