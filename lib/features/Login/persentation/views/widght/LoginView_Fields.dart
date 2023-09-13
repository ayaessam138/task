import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/constants.dart';
import 'package:task/features/Login/persentation/views/widght/TextField.dart';

class LoginViewFields extends StatelessWidget {
  final TextEditingController userName;
  final TextEditingController password;
  FocusNode userNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool obscureText = true;
  LoginViewFields({super.key, required this.userName, required this.password});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          customtextformfield(
            labeltext: 'UserName',
            prefixicon: Icons.person,
            controller: userName,
            valuevaldiation: (String? value) {
              if (value!.isEmpty) {
                return 'Username is required';
              }
            },
            foucusnode: userNameFocusNode,
          ),
          const SizedBox(
            height: 24,
          ),
          customtextformfield(
            obscureText: obscureText,
            prefixicon: Icons.lock_open_outlined,
            labeltext: 'Password',
            controller: password,
            valuevaldiation: (String? value) {
              if (value!.isEmpty) {
                return 'Password is required';
              }
            },
            foucusnode: passwordFocusNode,
          )
        ],
      ),
    );
  }
}
