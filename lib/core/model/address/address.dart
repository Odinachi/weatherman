import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  Address({
    this.municipality,
    this.countrySubdivision,
    this.countryCode,
    this.country,
    this.countryCodeIso3,
    this.freeformAddress,
    this.countrySecondarySubdivision,
    this.countrySubdivisionName,
  });

  String municipality;
  String countrySubdivision;
  String countryCode;
  String country;
  String countryCodeIso3;
  String freeformAddress;
  String countrySecondarySubdivision;
  String countrySubdivisionName;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
