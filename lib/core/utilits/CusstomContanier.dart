import 'package:flutter/material.dart';
import 'package:task/constants.dart';

class CustomContanier extends StatelessWidget {
  CustomContanier(
      {super.key,
      this.onTap,
      required this.text,
      this.height = 27,
      this.width = 70});
  String text;
  VoidCallback? onTap;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color.fromARGB(255, 233, 221, 221)),
          color: kprimaryColor,
        ),
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
