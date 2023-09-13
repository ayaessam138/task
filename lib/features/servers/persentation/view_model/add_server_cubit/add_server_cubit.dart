import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:task/features/servers/data/repos/servers_repo.dart';

part 'add_server_state.dart';

class AddServerCubit extends Cubit<AddServerState> {
  AddServerCubit(this.serversRepo) : super(AddServerInitial());
  final ServersRepo serversRepo;
  bool checkBoxValue = false;
  AddServer(AddServerModel addServerModel) async {
    emit(AddServerLoading());

    var result = await serversRepo.AddServer(addServerModel);

    result.fold((failure) {
      emit(AddServerfailure(ErrorMessage: failure.errormessage));
    }, (result) {
      emit(AddServersucess());
    });
  }
}
