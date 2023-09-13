part of 'add_server_cubit.dart';

@immutable
sealed class AddServerState {}

final class AddServerInitial extends AddServerState {}

final class AddServerLoading extends AddServerState {}

final class AddServersucess extends AddServerState {}

final class AddServerfailure extends AddServerState {
  String? ErrorMessage;
  AddServerfailure({this.ErrorMessage});
}
