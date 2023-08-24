part of 'weather_by_location_bloc.dart';

abstract class WeatherByLocationState extends Equatable {
  const WeatherByLocationState();
}

class WeatherByLocationInitial extends WeatherByLocationState {
  @override
  List<Object> get props => [];
}

class WeatherByLocationLoading extends WeatherByLocationState {
  @override
  List<Object> get props => [];
}

class WeatherByLocationError extends WeatherByLocationState {
  @override
  List<Object> get props => [];
}

class WeatherByLocationFetched extends WeatherByLocationState {

  final WeatherModel weatherModel;

  @override
  List<Object> get props => [weatherModel];

  const WeatherByLocationFetched({
    required this.weatherModel,
  });
}
