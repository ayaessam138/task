import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants.dart';
import 'package:task/features/servers/persentation/view_model/add_server_cubit/add_server_cubit.dart';

class DefaultServerCheck extends StatefulWidget {
  DefaultServerCheck({
    super.key,
  });
  @override
  State<DefaultServerCheck> createState() => _DefaultServerCheckState();
}

class _DefaultServerCheckState extends State<DefaultServerCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.check_circle,
              size: 14,
              color: kprimaryColor,
            ),
            const Text(
              'Deafult Server',
              style: TextStyle(color: kprimaryColor, fontSize: 12),
            ),
            const Spacer(),
            Checkbox(
                activeColor: kprimaryColor,
                value: BlocProvider.of<AddServerCubit>(context).checkBoxValue,
                onChanged: (value) {
                  setState(() {
                    BlocProvider.of<AddServerCubit>(context).checkBoxValue =
                        value!;
                  });
                })
          ],
        ),
        const Divider(
          height: 1,
          color: kprimaryColor,
          thickness: 0.2,
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
