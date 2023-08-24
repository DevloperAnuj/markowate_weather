
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:markowate_weather/models/Weather/weather_response_model.dart';
import 'package:markowate_weather/repositories/weather_repo.dart';

part 'weather_by_city_search_event.dart';

part 'weather_by_city_search_state.dart';

class WeatherByCitySearchBloc
    extends Bloc<WeatherByCitySearchEvent, WeatherByCitySearchState> {
  WeatherByCitySearchBloc() : super(WeatherByCitySearchInitial()) {
    final WeatherRepository weatherRepository = WeatherRepository();

    on<WeatherRequestCalledByCityName>((event, emit) async {
      emit(WeatherByCitySearchLoading());
      await weatherRepository
          .searchWeatherByCity(city: event.cityName)
          .then((weatherData) =>
              emit(WeatherByCitySearchFetched(weatherModel: weatherData)))
          .catchError((error, stackTrace) {
        print(stackTrace);
        emit(WeatherByCitySearchError());
      });
    });
  }
}
