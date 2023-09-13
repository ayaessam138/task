import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

part 'fingerprint_auth_state.dart';

class FingerprintAuthCubit extends Cubit<FingerprintAuthState> {
  final LocalAuthentication localAuth = LocalAuthentication();

  FingerprintAuthCubit() : super(FingerprintAuthInitial());

  Future<void> authenticateWithFingerprint() async {
    final isAvailable = await localAuth.canCheckBiometrics;

    if (isAvailable) {
      final didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Authenticate using your fingerprint',
      );

      if (didAuthenticate) {
        emit(FingerprintAuthSuccess());
      } else {
        emit(FingerprintAuthError(errorMessage: 'Authentication failed.'));
      }
    } else {
      emit(FingerprintAuthError(
          errorMessage: 'Your Devive do not Support FingerPrint'));
    }
  }
}
