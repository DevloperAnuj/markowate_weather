part of 'getting_device_location_cubit.dart';

abstract class GettingDeviceLocationState extends Equatable {
  const GettingDeviceLocationState();
}

class GettingDeviceLocationInitial extends GettingDeviceLocationState {
  @override
  List<Object> get props => [];
}

class GettingDeviceLocationLoading extends GettingDeviceLocationState {
  @override
  List<Object> get props => [];
}

class GettingDeviceLocationFetched extends GettingDeviceLocationState {
  final double lat;
  final double lon;

  @override
  List<Object> get props => [lat, lon];

  const GettingDeviceLocationFetched({
    required this.lat,
    required this.lon,
  });
}

class GettingDeviceLocationError extends GettingDeviceLocationState {
  @override
  List<Object> get props => [];
}
