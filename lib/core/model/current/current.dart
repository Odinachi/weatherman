import 'package:json_annotation/json_annotation.dart';
import 'package:weatherman/core/model/rain/rain.dart';
import 'package:weatherman/core/model/weather/weather.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
    this.rain,
  });

  int dt;
  int sunrise;
  int sunset;
  double temp;
  @JsonKey(name: "feels_like")
  double feelsLike;
  int pressure;
  int humidity;
  @JsonKey(name: "dew_point")
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  @JsonKey(name: "wind_speed")
  double windSpeed;
  @JsonKey(name: "wind_deg")
  int windDeg;
  @JsonKey(name: "wind_gust")
  double windGust;
  List<Weather> weather;
  double pop;
  Rain rain;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
