import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/features/Login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  login({required String email, required String password}) async {
    var result = await loginRepo.login(body: {
      'email': email,
      'password': password,
    });

    result.fold((failure) {
      emit(Loginfailure(ErrorMessage: failure.errormessage));
    }, (result) {
      emit(Loginsucess());
    });
  }
}
