import 'package:json_annotation/json_annotation.dart';
import 'package:weatherman/core/model/current/current.dart';
import 'package:weatherman/core/model/daily/daily.dart';
import 'package:weatherman/core/model/minute/minute.dart';

part 'data_response_model.g.dart';

@JsonSerializable()
class DataResponseModel {
  DataResponseModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
  });

  double lat;
  double lon;
  String timezone;
  @JsonKey(name: "timezone_offset")
  int timezoneOffset;
  Current current;
  List<Minutely> minutely;
  List<Current> hourly;
  List<Daily> daily;

  factory DataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseModelToJson(this);
}

enum Description {
  CLEAR_SKY,
  BROKEN_CLOUDS,
  LIGHT_RAIN,
  MODERATE_RAIN,
  OVERCAST_CLOUDS,
  FEW_CLOUDS,
  SCATTERED_CLOUDS
}

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "light rain": Description.LIGHT_RAIN,
  "moderate rain": Description.MODERATE_RAIN,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum Main { CLEAR, CLOUDS, RAIN }

final mainValues =
    EnumValues({"Clear": Main.CLEAR, "Clouds": Main.CLOUDS, "Rain": Main.RAIN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
