import 'package:hive/hive.dart';
part 'AddServerModel.g.dart';

@HiveType(typeId: 0)
class AddServerModel extends HiveObject {
  @HiveField(0)
  String ServerName;
  @HiveField(1)
  String ServerIP;
  @HiveField(2)
  final bool DeafultServer;

  AddServerModel(
      {required this.ServerName,
      required this.ServerIP,
      required this.DeafultServer});
}
