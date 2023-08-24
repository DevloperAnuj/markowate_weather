import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logics/getting_device_location_cubit/getting_device_location_cubit.dart';
import '../../logics/weather_by_location_bloc/weather_by_location_bloc.dart';
import '../core/my_gradient_background.dart';
import '../core/my_null_widget.dart';
import 'home_page_compnents/date_component.dart';
import 'home_page_compnents/location_loading_component.dart';
import 'home_page_compnents/weather_error_component.dart';
import 'home_page_compnents/weather_loading_component.dart';
import 'home_page_compnents/weather_placename_component.dart';
import 'home_page_widgets/weather_primary_widget.dart';
import 'home_page_widgets/weather_secondary_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    void fetchWeatherByDeviceLocation(
        {required double lat, required double lon}) {
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WeatherPlaceNameComponent(
                          cityName: state.weatherModel.name,
                          lat: locState.lat,
                          lon: locState.lon,
                        ),
                        const DateComponent(),
                        WeatherPrimaryCardWidget(
                          temp: state.weatherModel.main.temp.round().toString(),
                          weatherDesc:
                              state.weatherModel.weather.first.description,
                        ),
                        WeatherSecondaryWidget(
                          cloudy: state.weatherModel.clouds.all.toString(),
                          humidity: state.weatherModel.main.humidity.toString(),
                          windSpeed: state.weatherModel.wind.speed.toString(),
                        ),
                      ],
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
