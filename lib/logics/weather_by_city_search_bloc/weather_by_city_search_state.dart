part of 'weather_by_city_search_bloc.dart';

abstract class WeatherByCitySearchState extends Equatable {
  const WeatherByCitySearchState();
}

class WeatherByCitySearchInitial extends WeatherByCitySearchState {
  @override
  List<Object> get props => [];
}

class WeatherByCitySearchLoading extends WeatherByCitySearchState {
  @override
  List<Object> get props => [];
}

class WeatherByCitySearchFetched extends WeatherByCitySearchState {

  final WeatherModel weatherModel;

  @override
  List<Object> get props => [weatherModel];

  const WeatherByCitySearchFetched({
    required this.weatherModel,
  });
}

class WeatherByCitySearchError extends WeatherByCitySearchState {
  @override
  List<Object> get props => [];
}
