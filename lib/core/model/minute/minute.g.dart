// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Minutely _$MinutelyFromJson(Map<String, dynamic> json) => Minutely(
      dt: json['dt'] as int,
      precipitation: json['precipitation'] as int,
    );

Map<String, dynamic> _$MinutelyToJson(Minutely instance) => <String, dynamic>{
      'dt': instance.dt,
      'precipitation': instance.precipitation,
    };
