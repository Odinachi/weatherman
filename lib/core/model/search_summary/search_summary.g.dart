// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSummary _$SearchSummaryFromJson(Map<String, dynamic> json) =>
    SearchSummary(
      query: json['query'] as String,
      queryType: json['queryType'] as String,
      queryTime: json['queryTime'] as int,
      numResults: json['numResults'] as int,
      offset: json['offset'] as int,
      totalResults: json['totalResults'] as int,
      fuzzyLevel: json['fuzzyLevel'] as int,
    );

Map<String, dynamic> _$SearchSummaryToJson(SearchSummary instance) =>
    <String, dynamic>{
      'query': instance.query,
      'queryType': instance.queryType,
      'queryTime': instance.queryTime,
      'numResults': instance.numResults,
      'offset': instance.offset,
      'totalResults': instance.totalResults,
      'fuzzyLevel': instance.fuzzyLevel,
    };
