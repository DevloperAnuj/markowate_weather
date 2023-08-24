import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markowate_weather/logics/getting_device_location_cubit/getting_device_location_cubit.dart';
import 'package:markowate_weather/logics/internet_connection_status/internet_connection_status_cubit.dart';
import 'package:markowate_weather/logics/weather_by_city_search_bloc/weather_by_city_search_bloc.dart';
import 'package:markowate_weather/logics/weather_by_location_bloc/weather_by_location_bloc.dart';
import 'package:markowate_weather/ui/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => GettingDeviceLocationCubit()..getDeviceLocation()),
          BlocProvider(create: (_) => WeatherByLocationBloc()),
          BlocProvider(create: (_) => WeatherByCitySearchBloc()),
          BlocProvider(create: (_) => InternetConnectionStatusCubit()),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}
