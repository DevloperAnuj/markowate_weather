import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markowate_weather/ui/core/my_gradient_background.dart';
import 'package:markowate_weather/ui/core/my_null_widget.dart';
import 'weather_detail_page_components/city_weather_error_component.dart';
import 'weather_details_page_widgets/city_weather_data_widget.dart';
import '../../logics/weather_by_city_search_bloc/weather_by_city_search_bloc.dart';
import 'weather_detail_page_components/city_weather_appbar_search_component.dart';
import 'weather_detail_page_components/city_weather_initial_component.dart';
import 'weather_detail_page_components/city_weather_loading_component.dart';

class WeatherDetailsPage extends StatefulWidget {
  const WeatherDetailsPage({super.key});

  @override
  State<WeatherDetailsPage> createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherByCitySearchBloc>(
      lazy: true,
      create: (context) => WeatherByCitySearchBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: const MyAppbarWithSearch(),
          body: MyGradientBackGround(
            child: SingleChildScrollView(
              child: BlocBuilder<WeatherByCitySearchBloc,
                  WeatherByCitySearchState>(
                builder: (context, state) {
                  if (state is WeatherByCitySearchInitial) {
                    return const CityWeatherInitialComponent();
                  } else if (state is WeatherByCitySearchLoading) {
                    return const CityWeatherLoadingComponent();
                  } else if (state is WeatherByCitySearchFetched) {
                    return CityWeatherDataWidget(
                      cityName: state.weatherModel.name,
                      desc: state.weatherModel.weather.first.description,
                      temp: state.weatherModel.main.temp,
                      humidity: state.weatherModel.main.humidity,
                      windSpeed: state.weatherModel.wind.speed,
                      cloudy: state.weatherModel.clouds.all,
                    );
                  } else if (state is WeatherByCitySearchError) {
                    return const CityWeatherErrorComponent();
                  }
                  return const NullWidget();
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}



