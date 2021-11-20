import 'package:json_annotation/json_annotation.dart';

part 'search_geometry.g.dart';

@JsonSerializable()
class SearchGeometry {
  SearchGeometry({
    this.id,
  });

  String id;

  factory SearchGeometry.fromJson(Map<String, dynamic> json) =>
      _$SearchGeometryFromJson(json);

  Map<String, dynamic> toJson() => _$SearchGeometryToJson(this);
}
