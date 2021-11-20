// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return SearchResult(
    // type: $enumDecode(_$TypeEnumMap, json['type']),
    id: json['id'] as String,
    score: (json['score'] as num).toDouble(),
    // entityType: $enumDecode(_$EntityTypeEnumMap, json['entityType']),
    address: Address.fromJson(json['address'] as Map<String, dynamic>),
    position: SearchPosition.fromJson(json['position'] as Map<String, dynamic>),
    viewport: BoundingBox.fromJson(json['viewport'] as Map<String, dynamic>),
    boundingBox:
        BoundingBox.fromJson(json['boundingBox'] as Map<String, dynamic>),
    dataSources:
        DataSources.fromJson(json['dataSources'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'type': _$TypeEnumMap[instance.type],
      'id': instance.id,
      'score': instance.score,
      'entityType': _$EntityTypeEnumMap[instance.entityType],
      'address': instance.address,
      'position': instance.position,
      'viewport': instance.viewport,
      'boundingBox': instance.boundingBox,
      'dataSources': instance.dataSources,
    };

const _$TypeEnumMap = {Type.GEOGRAPHY: 'Geography', Type.STREET: "Street"};

const _$EntityTypeEnumMap = {
  EntityType.MUNICIPALITY: 'Municipality',
  EntityType.MUNICIPALITYSUBDIVISION: 'MunicipalitySubdivision'
};
