import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task/constants.dart';
import 'package:task/core/utilits/Dialog.dart';
import 'package:task/features/Login/persentation/view_model/FingerprintAuth/cubit/fingerprint_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FingerprintAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FingerprintAuthCubit, FingerprintAuthState>(
      listener: (context, state) {
        if (state is FingerprintAuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Authentication successful!')),
          );
        } else if (state is FingerprintAuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            var box = Hive.box('box');
            if (box.values.toList().isEmpty) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DialogWithTwoButton(
                      title: 'Enable FingerPrint',
                      content:
                          'Do You Want to logging in to icode critical Results with your Fingerprint?',
                      button1Text: 'Yes',
                      button2Text: 'No',
                      onTap1: () async {
                        final fingercubit =
                            BlocProvider.of<FingerprintAuthCubit>(context);

                        var fingerprint = await box.add(true);
                        print(fingerprint.toString());
                        fingercubit.authenticateWithFingerprint();
                        Navigator.pop(context);
                      },
                      onTap2: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'You Must Enable FingerPrint to be ebale to Login ')),
                        );
                        Navigator.pop(context);
                      },
                    );
                  });
            } else {
              BlocProvider.of<FingerprintAuthCubit>(context)
                  .authenticateWithFingerprint();
            }
          },
          icon: Icon(Icons.fingerprint),
        );
      },
    );
  }
}
