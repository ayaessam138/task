// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddServerModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddServerModelAdapter extends TypeAdapter<AddServerModel> {
  @override
  final int typeId = 0;

  @override
  AddServerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddServerModel(
      ServerName: fields[0] as String,
      ServerIP: fields[1] as String,
      DeafultServer: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AddServerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ServerName)
      ..writeByte(1)
      ..write(obj.ServerIP)
      ..writeByte(2)
      ..write(obj.DeafultServer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddServerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
