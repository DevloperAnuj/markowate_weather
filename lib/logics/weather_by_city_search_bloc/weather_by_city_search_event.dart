part of 'weather_by_city_search_bloc.dart';

abstract class WeatherByCitySearchEvent extends Equatable {
  const WeatherByCitySearchEvent();
}

class WeatherRequestCalledByCityName extends WeatherByCitySearchEvent {

  final String cityName;

  const WeatherRequestCalledByCityName({required this.cityName});

  @override
  // TODO: implement props
  List<Object?> get props => [cityName];
}
