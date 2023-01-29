part of 'ip_cubit.dart';


@immutable
abstract class IpState extends Equatable {
  @override
  List<Object> get props => [];
}

class IpInit extends IpState {}

class IpLoading extends IpState {}

class IpUnexpectedError extends IpState {}

class IpInvalid extends IpState {}

class IpLoaded extends IpState {
  final IpDataModel state;

  IpLoaded(this.state);

  @override
  List<Object> get props => [state];

  String get ip => state.ip;
  String get continentCode => state.continentCode;
  String get continentName => state.continentName;
  String get countryCode2 => state.countryCode2;
  String get countryName => state.countryName;
  String get stateProv => state.stateProv;
  String get city => state.city;
  String get zipcode => state.zipcode;
  double get latitude => state.latitude;
  double get longitude => state.longitude;
  String get callingCode => state.callingCode;
  String get countryTld => state.countryTld;
  String get languages => state.languages;
  String get countryFlag => state.countryFlag;
  String get isp => state.isp;
  String get connectionType => state.connectionType;
}

