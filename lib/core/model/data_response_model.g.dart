// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponseModel _$DataResponseModelFromJson(Map<String, dynamic> json) {
  return DataResponseModel(
    lat: (json['lat'] as num).toDouble(),
    lon: (json['lon'] as num).toDouble(),
    timezone: json['timezone'] as String,
    timezoneOffset: json['timezone_offset'] as int,
    current: Current.fromJson(json['current'] as Map<String, dynamic>),
    // minutely: (json['minutely'] as List<dynamic>)
    //     .map((e) => Minutely.fromJson(e as Map<String, dynamic>))
    //     .toList(),
    hourly: (json['hourly'] as List<dynamic>)
        .map((e) => Current.fromJson(e as Map<String, dynamic>))
        .toList(),
    daily: (json['daily'] as List<dynamic>)
        .map((e) => Daily.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataResponseModelToJson(DataResponseModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'current': instance.current,
      'minutely': instance.minutely,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
