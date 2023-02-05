import 'package:equatable/equatable.dart';

class IpDataModel extends Equatable {
  final String ip;
  final String continentCode;
  final String continentName;
  final String countryCode2;
  final String countryName;
  final String stateProv;
  final String city;
  final String zipcode;
  final double latitude;
  final double longitude;
  final String callingCode;
  final String countryTld;
  final String languages;
  final String countryFlag;
  final String isp;
  final String connectionType;

  const IpDataModel({
    required this.ip,
    required this.continentCode,
    required this.continentName,
    required this.countryCode2,
    required this.countryName,
    required this.stateProv,
    required this.city,
    required this.zipcode,
    required this.latitude,
    required this.longitude,
    required this.callingCode,
    required this.countryTld,
    required this.languages,
    required this.countryFlag,
    required this.isp,
    required this.connectionType,
  });

  factory IpDataModel.fromJson(String ip, dynamic json) {
    return IpDataModel(
      ip: ip,
      continentCode: json['continent_code'] ?? '___',
      continentName: json['continent_name'] ?? '___',
      countryCode2: json['country_code2'] ?? '___',
      countryName: json['country_name'] ?? '___',
      stateProv: json['state_prov'] ?? '___',
      city: json['city'] ?? '___',
      zipcode: json['zipcode'] ?? '___',
      latitude: double.parse(json['latitude'] ?? '0.0'),
      longitude: double.parse(json['longitude'] ?? '0.0'),
      callingCode: json['calling_code'] ?? '___',
      countryTld: json['country_tld'] ?? '___',
      languages: json['languages'] ?? '___',
      countryFlag: 'https://countryflagsapi.com/png/${json['country_code2'].toLowerCase() ?? 'us'}',
      isp: json['isp'] ?? '___',
      connectionType: json['connection_type'] ?? '___',
    );
  }

  @override
  List<Object> get props => [
        ip,
        continentCode,
        continentName,
        countryCode2,
        countryName,
        stateProv,
        city,
        zipcode,
        latitude,
        longitude,
        callingCode,
        countryTld,
        languages,
        countryFlag,
        isp,
        connectionType,
      ];
}
