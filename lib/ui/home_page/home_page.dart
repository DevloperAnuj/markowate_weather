import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logics/getting_device_location_cubit/getting_device_location_cubit.dart';
import '../../logics/weather_by_location_bloc/weather_by_location_bloc.dart';
import '../core/my_gradient_background.dart';
import '../core/my_null_widget.dart';
import 'home_page_compnents/location_loading_component.dart';
import 'home_page_compnents/weather_error_component.dart';
import 'home_page_compnents/weather_loading_component.dart';
import 'home_page_widgets/weather_data_widget.dart';

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void fetchWeatherByDeviceLocation({
      required double lat,
      required double lon,
    }) {
      context.read<WeatherByLocationBloc>().add(
            FetchWeatherByLocationEvent(
              lat: lat,
              lon: lon,
            ),
          );
    }

    return Scaffold(
      body: MyGradientBackGround(
        child: BlocConsumer<GettingDeviceLocationCubit,
            GettingDeviceLocationState>(
          listener: (context, state) {
            if (state is GettingDeviceLocationFetched) {
              fetchWeatherByDeviceLocation(lat: state.lat, lon: state.lon);
            }
          },
          builder: (context, locState) {
            if (locState is GettingDeviceLocationLoading) {
              return const LocationLoadingComponent();
            } else if (locState is GettingDeviceLocationFetched) {
              return BlocBuilder<WeatherByLocationBloc, WeatherByLocationState>(
                builder: (context, state) {
                  if (state is WeatherByLocationLoading) {
                    return const WeatherLoadingComponent();
                  } else if (state is WeatherByLocationError) {
                    return const WeatherErrorComponent();
                  } else if (state is WeatherByLocationFetched) {
                    return WeatherDataWidget(
                      cityName: state.weatherModel.name,
                      desc: state.weatherModel.weather.first.description,
                      temp: state.weatherModel.main.temp,
                      humidity: state.weatherModel.main.humidity,
                      windSpeed: state.weatherModel.wind.speed,
                      cloudy: state.weatherModel.clouds.all,
                      lat: locState.lat,
                      lon: locState.lon,
                    );
                  }
                  return const NullWidget();
                },
              );
            }
            return const NullWidget();
          },
        ),
      ),
    );
  }
}

