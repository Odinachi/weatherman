import 'package:json_annotation/json_annotation.dart';
import 'package:weatherman/core/model/search_position/search_position.dart';

part 'bounding_box.g.dart';

@JsonSerializable()
class BoundingBox {
  BoundingBox({
    this.topLeftPoint,
    this.btmRightPoint,
  });

  SearchPosition topLeftPoint;
  SearchPosition btmRightPoint;

  factory BoundingBox.fromJson(Map<String, dynamic> json) =>
      _$BoundingBoxFromJson(json);

  Map<String, dynamic> toJson() => _$BoundingBoxToJson(this);
}
