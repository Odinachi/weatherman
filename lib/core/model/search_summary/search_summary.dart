import 'package:json_annotation/json_annotation.dart';

part 'search_summary.g.dart';

@JsonSerializable()
class SearchSummary {
  SearchSummary({
    this.query,
    this.queryType,
    this.queryTime,
    this.numResults,
    this.offset,
    this.totalResults,
    this.fuzzyLevel,
  });

  String query;
  String queryType;
  int queryTime;
  int numResults;
  int offset;
  int totalResults;
  int fuzzyLevel;

  factory SearchSummary.fromJson(Map<String, dynamic> json) =>
      _$SearchSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSummaryToJson(this);
}
