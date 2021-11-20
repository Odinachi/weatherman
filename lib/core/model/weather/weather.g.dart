// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    id: json['id'] as int,
    main: $enumDecode(_$MainEnumMap, json['main']),
    description: $enumDecode(_$DescriptionEnumMap, json['description']),
    icon: json['icon'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': _$MainEnumMap[instance.main],
      'description': _$DescriptionEnumMap[instance.description],
      'icon': instance.icon,
    };

const _$MainEnumMap = {
  Main.CLEAR: 'Clear',
  Main.CLOUDS: 'Clouds',
  Main.RAIN: 'Rain',
};

const _$DescriptionEnumMap = {
  Description.CLEAR_SKY: 'clear sky',
  Description.BROKEN_CLOUDS: 'broken clouds',
  Description.LIGHT_RAIN: 'light rain',
  Description.MODERATE_RAIN: 'moderate rain',
  Description.OVERCAST_CLOUDS: 'overcast clouds',
  Description.FEW_CLOUDS: 'few clouds',
  Description.SCATTERED_CLOUDS: 'scattered clouds',
};
