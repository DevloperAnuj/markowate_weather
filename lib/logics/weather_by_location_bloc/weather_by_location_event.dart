part of 'weather_by_location_bloc.dart';

abstract class WeatherByLocationEvent extends Equatable {
  const WeatherByLocationEvent();
}

class FetchWeatherByLocationEvent extends WeatherByLocationEvent {

  final double lat;
  final double lon;

  @override
  List<Object?> get props => [lat,lon];

  const FetchWeatherByLocationEvent({
    required this.lat,
    required this.lon,
  });
}
