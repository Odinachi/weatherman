// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPosition _$SearchPositionFromJson(Map<String, dynamic> json) =>
    SearchPosition(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$SearchPositionToJson(SearchPosition instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
