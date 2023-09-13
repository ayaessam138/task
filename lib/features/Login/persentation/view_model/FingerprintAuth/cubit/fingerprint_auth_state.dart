part of 'fingerprint_auth_cubit.dart';

@immutable
abstract class FingerprintAuthState {}

class FingerprintAuthInitial extends FingerprintAuthState {}

class FingerprintAuthSuccess extends FingerprintAuthState {}

class FingerprintAuthError extends FingerprintAuthState {
  final String errorMessage;

  FingerprintAuthError({required this.errorMessage});
}
