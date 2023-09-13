part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class Loginsucess extends LoginState {}

final class Loginfailure extends LoginState {
  String? ErrorMessage;
  Loginfailure({this.ErrorMessage});
}
