// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleAdapter extends TypeAdapter<Vehicle> {
  @override
  final int typeId = 17;

  @override
  Vehicle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vehicle(
      id: fields[0] == null ? '' : fields[0] as String,
      name: fields[1] == null ? '' : fields[1] as String,
      tankCapacity: fields[2] == null ? '' : fields[2] as String,
      isDefault: fields[3] == null ? false : fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Vehicle obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.tankCapacity)
      ..writeByte(3)
      ..write(obj.isDefault);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Vehicle _$$_VehicleFromJson(Map<String, dynamic> json) => _$_Vehicle(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      tankCapacity: json['tankCapacity'] as String? ?? '',
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$$_VehicleToJson(_$_Vehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tankCapacity': instance.tankCapacity,
      'isDefault': instance.isDefault,
    };
