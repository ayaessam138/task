import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants.dart';
import 'package:task/core/utilits/CusstomContanier.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:task/features/servers/persentation/view_model/_Fetch_server_cubit/fetch_server_cubit.dart';

class DialogWithTwoButton extends StatelessWidget {
  final String title;
  final String content;
  final String button1Text;
  final String button2Text;
  final AddServerModel? addServerModel;
  DialogWithTwoButton({
    super.key,
    required this.title,
    required this.content,
    required this.button1Text,
    required this.button2Text,
    this.addServerModel,
    required this.onTap1,
    required this.onTap2,
  });
  final void Function()? onTap1;
  final void Function()? onTap2;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 18, right: 18, top: 30),
      titlePadding: EdgeInsets.zero,
      title: DialogTitle(
        title: title,
      ),
      content: Text(
        content,
        style: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w700, color: kprimaryColor),
      ),
      actions: [
        const Divider(
          thickness: 0.5,
          color: kprimaryColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContanier(onTap: onTap1, text: button1Text),
            CustomContanier(onTap: onTap2, text: button2Text),
          ],
        ),
      ],
    );
  }
}

class DialogWithOneButton extends StatelessWidget {
  final String title;
  final String content;
  final String button1Text;

  const DialogWithOneButton({
    super.key,
    required this.title,
    required this.content,
    required this.button1Text,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: DialogTitle(
        title: title,
      ),
      content: Text(content),
      actions: [
        const Divider(
          thickness: 0.5,
          color: kprimaryColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContanier(text: button1Text),
          ],
        ),
      ],
    );
  }
}

class DialogTitle extends StatelessWidget {
  const DialogTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: kprimaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4), topRight: Radius.circular(4)),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
