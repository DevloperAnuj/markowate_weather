import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:markowate_weather/models/Weather/weather_response_model.dart';

import '../../repositories/weather_repo.dart';

part 'weather_by_location_event.dart';

part 'weather_by_location_state.dart';

class WeatherByLocationBloc
    extends Bloc<WeatherByLocationEvent, WeatherByLocationState> {
  WeatherByLocationBloc() : super(WeatherByLocationInitial()) {

    final WeatherRepository weatherRepository = WeatherRepository();

    on<FetchWeatherByLocationEvent>((event, emit) async {
      emit(WeatherByLocationLoading());
      await weatherRepository
          .searchWeatherByCoordinates(lon: event.lon, lat: event.lat)
          .then(
            (weatherData) =>
                emit(WeatherByLocationFetched(weatherModel: weatherData)),
          )
          .catchError(
            (error, stackTrace) {
              emit(WeatherByLocationError());
            },
          );
    });
  }
}
