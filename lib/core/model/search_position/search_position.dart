import 'package:json_annotation/json_annotation.dart';

part 'search_position.g.dart';

@JsonSerializable()
class SearchPosition {
  SearchPosition({
    this.lat,
    this.lon,
  });

  double lat;
  double lon;

  factory SearchPosition.fromJson(Map<String, dynamic> json) =>
      _$SearchPositionFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPositionToJson(this);
}
