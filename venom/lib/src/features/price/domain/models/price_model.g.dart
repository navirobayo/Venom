// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceAdapter extends TypeAdapter<Price> {
  @override
  final int typeId = 5;

  @override
  Price read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Price(
      id: fields[0] == null ? 0 : fields[0] as int?,
      price: fields[1] == null ? 0.0 : fields[1] as double?,
      placeOfPurchase: fields[2] == null ? '' : fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Price obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.placeOfPurchase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Price _$$_PriceFromJson(Map<String, dynamic> json) => _$_Price(
      id: json['id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      placeOfPurchase: json['placeOfPurchase'] as String?,
    );

Map<String, dynamic> _$$_PriceToJson(_$_Price instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'placeOfPurchase': instance.placeOfPurchase,
    };