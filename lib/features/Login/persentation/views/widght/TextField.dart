import 'package:flutter/material.dart';
import 'package:task/constants.dart';

class customtextformfield extends StatelessWidget {
  customtextformfield(
      {super.key,
      this.onchanged,
      this.labeltext,
      required this.controller,
      required this.valuevaldiation,
      required this.foucusnode,
      required this.prefixicon,
      this.obscureText});

  String? labeltext;
  FormFieldValidator<String> valuevaldiation;
  FocusNode? foucusnode;
  Function(dynamic)? onchanged;
  bool? obscureText;
  IconData prefixicon;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Container(
              color: Colors.grey, //color of divider
              width: double.infinity,
              height: 1, //width space of divider
            ),
          ),
          Row(
            children: [
              Container(
                color: Colors.grey, //color of divider
                width: 1,
                height: 60, //width space of divider
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: TextFormField(
                      controller: controller,
                      validator: valuevaldiation,
                      onChanged: onchanged,
                      obscureText: obscureText ?? false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        label: Row(
                          children: [
                            Icon(
                              prefixicon,
                              color: kprimaryColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              labeltext!,
                              style: TextStyle(color: kprimaryColor),
                            )
                          ],
                        ),
                      )),
                ),
              ),
              Container(
                color: Colors.grey, //color of divider
                width: 1,
                height: 60, //width space of divider
              ),
            ],
          ),
        ],
      ),
    );
  }
}
