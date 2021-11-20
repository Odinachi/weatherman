import 'package:json_annotation/json_annotation.dart';
import 'package:weatherman/core/model/search_geometry/search_geometry.dart';

part 'data_source.g.dart';

@JsonSerializable()
class DataSources {
  DataSources({
    this.geometry,
  });

  SearchGeometry geometry;

  factory DataSources.fromJson(Map<String, dynamic> json) =>
      _$DataSourcesFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourcesToJson(this);
}
