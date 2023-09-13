import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task/constants.dart';
import 'package:task/core/utilits/App_Route.dart';
import 'package:task/core/utilits/Dialog.dart';
import 'package:task/core/utilits/CusstomContanier.dart';
import 'package:task/features/Login/persentation/view_model/cubit/login_cubit.dart';
import 'package:task/features/Login/persentation/views/fingerprintAuth.dart';
import 'package:task/features/Login/persentation/views/widght/LoginView_Fields.dart';
import 'package:task/features/Login/persentation/views/widght/TextField.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';

class LoginView extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey();

  String? content, Title;

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 18,
          ),
          Center(child: Image.asset('assest/images/splash screen logo.png')),
          const SizedBox(
            height: 30,
          ),
          Form(
              key: formkey,
              child: LoginViewFields(
                userName: username,
                password: password,
              )),
          const SizedBox(
            height: 30,
          ),
          CustomContanier(
            width: 65,
            height: 35,
            text: 'Login',
            onTap: () {
              BlocProvider.of<LoginCubit>(context)
                  .login(email: username.text, password: password.text);
            },
          ),
          FingerprintAuthScreen()
        ]),
      )),
    );
  }
}
