import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/constants.dart';
import 'package:task/features/servers/data/models/AddServerModel.dart';
import 'package:task/features/servers/persentation/views/AddServer.dart';
import 'package:task/features/servers/persentation/views/DeleteServer.dart';
import 'package:task/features/servers/persentation/views/EditServer.dart';

class ServerInfo extends StatelessWidget {
  final AddServerModel addServerModel;

  const ServerInfo({super.key, required this.addServerModel});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Clickablebutton(
            icon: FontAwesomeIcons.solidEdit,
            color: kprimaryColor,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return EditServerView(
                      title: 'Edit New Server',
                      addServerModel: addServerModel,
                    );
                  });
            },
          ),
          const SizedBox(
            width: 3,
          ),
          Clickablebutton(
            color: Colors.red,
            icon: FontAwesomeIcons.solidTrashCan,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DelteServerView(
                      addServerModel: addServerModel,
                    );
                  });
            },
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Server Name:',
                    style: TextStyle(
                        color: kprimaryColor, fontWeight: FontWeight.w700)),
                Text(
                  addServerModel.ServerName,
                ),
                // Spacer(),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const Text('Sever IP/domain:',
                    style: TextStyle(
                        color: kprimaryColor, fontWeight: FontWeight.w700)),
                Text(addServerModel.ServerIP)
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const Text('Default Server:',
                    style: TextStyle(
                        color: kprimaryColor, fontWeight: FontWeight.w700)),
                Text(addServerModel.DeafultServer.toString())
              ],
            ),
            Divider(
              color: Colors.grey[700],
            )
          ],
        ),
      ),
    ]);
  }
}

class Clickablebutton extends StatelessWidget {
  IconData icon;
  Color color;
  void Function() onTap;
  Clickablebutton({
    required this.onTap,
    required this.color,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}
