import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:task/features/servers/data/repos/servers_repo.dart';

part 'fetch_server_state.dart';

class FetchServerCubit extends Cubit<FetchServerState> {
  FetchServerCubit(this.serversRepo) : super(FetchServerInitial());
  final ServersRepo serversRepo;
  List<AddServerModel> servers = [];
  fetchServer() async {
    servers = serversRepo.FetchServers();

    emit(FetchServersucess(servers));
  }
}
