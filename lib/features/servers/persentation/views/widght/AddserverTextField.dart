import 'package:flutter/material.dart';
import 'package:task/constants.dart';

class AddServerTextField extends StatelessWidget {
  final String labeltext;
  // final Function(dynamic)? onsaved;
  final IconData prefixicon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const AddServerTextField(
      {super.key,
      required this.labeltext,
      required this.prefixicon,
      required this.controller,
      required this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        label: Row(
          children: [
            Icon(
              prefixicon,
              size: 14,
              color: kprimaryColor,
            ),
            const SizedBox(width: 4),
            Text(
              labeltext!,
              style: TextStyle(color: kprimaryColor, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
