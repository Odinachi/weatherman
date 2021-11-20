import 'package:json_annotation/json_annotation.dart';
import 'package:weatherman/core/model/address/address.dart';
import 'package:weatherman/core/model/bounding_box/bounding_box.dart';
import 'package:weatherman/core/model/data_source/data_source.dart';
import 'package:weatherman/core/model/search_position/search_position.dart';
import 'package:weatherman/core/model/search_response_model.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  SearchResult({
    this.type,
    this.id,
    this.score,
    this.entityType,
    this.address,
    this.position,
    this.viewport,
    this.boundingBox,
    this.dataSources,
  });

  Type type;
  String id;
  double score;
  EntityType entityType;
  Address address;
  SearchPosition position;
  BoundingBox viewport;
  BoundingBox boundingBox;
  DataSources dataSources;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
