// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      municipality: json['municipality'] as String,
      countrySubdivision: json['countrySubdivision'] as String,
      countryCode: json['countryCode'] as String,
      country: json['country'] as String,
      countryCodeIso3: json['countryCodeIso3'] as String,
      freeformAddress: json['freeformAddress'] as String,
      countrySecondarySubdivision:
          json['countrySecondarySubdivision'] as String,
      countrySubdivisionName: json['countrySubdivisionName'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'municipality': instance.municipality,
      'countrySubdivision': instance.countrySubdivision,
      'countryCode': instance.countryCode,
      'country': instance.country,
      'countryCodeIso3': instance.countryCodeIso3,
      'freeformAddress': instance.freeformAddress,
      'countrySecondarySubdivision': instance.countrySecondarySubdivision,
      'countrySubdivisionName': instance.countrySubdivisionName,
    };
