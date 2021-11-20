import 'package:json_annotation/json_annotation.dart';
import 'package:weatherman/core/model/search_result/search_result.dart';
import 'package:weatherman/core/model/search_summary/search_summary.dart';

part 'search_response_model.g.dart';

@JsonSerializable()
class SearchResponseModel {
  SearchResponseModel({
    this.summary,
    this.searchResults,
  });

  SearchSummary summary;
  List<SearchResult> searchResults;

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);
}

enum EntityType { MUNICIPALITY, MUNICIPALITYSUBDIVISION }

final entityTypeValues = EnumValues({
  "Municipality": EntityType.MUNICIPALITY,
  'MunicipalitySubdivision': EntityType.MUNICIPALITYSUBDIVISION
});

enum Type { GEOGRAPHY, STREET }

final typeValues =
    EnumValues({"Geography": Type.GEOGRAPHY, "Street": Type.STREET});

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
