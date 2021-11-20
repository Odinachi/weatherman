import 'package:json_annotation/json_annotation.dart';
import 'package:weatherman/core/model/data_response_model.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int id;
  Main main;
  Description description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
