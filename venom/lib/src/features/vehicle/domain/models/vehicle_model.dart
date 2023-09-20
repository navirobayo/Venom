import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'vehicle_model.freezed.dart';
part 'vehicle_model.g.dart';

@Freezed(
  makeCollectionsUnmodifiable: true,
  copyWith: true,
  fromJson: true,
  toJson: true,
  equal: true,
)

/// asd
@HiveType(typeId: 17)
class Vehicle with _$Vehicle {
  ///adsasd
  factory Vehicle({
    @HiveField(0, defaultValue: '') @Default('') String id,
    @HiveField(1, defaultValue: '') @Default('') String name,
    @HiveField(2, defaultValue: '') @Default('') String tankCapacity,
    @HiveField(3, defaultValue: false) @Default(false) bool isDefault,
  }) = _Vehicle;

  ///das
  factory Vehicle.fromJson(Map<String, Object?> json) =>
      _$VehicleFromJson(json);
}
