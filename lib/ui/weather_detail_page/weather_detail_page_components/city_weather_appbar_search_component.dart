import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logics/weather_by_city_search_bloc/weather_by_city_search_bloc.dart';

class MyAppbarWithSearch extends StatefulWidget implements PreferredSizeWidget {
  const MyAppbarWithSearch({
    super.key,
  });

  @override
  State<MyAppbarWithSearch> createState() => _MyAppbarWithSearchState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppbarWithSearchState extends State<MyAppbarWithSearch> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void fetchWeatherByCityNameFunction({required String cityName}) {
      context.read<WeatherByCitySearchBloc>().add(
        WeatherRequestCalledByCityName(
          cityName: cityName,
        ),
      );
    }

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: TextField(
        controller: searchController,
      ),
      actions: [
        IconButton(
          onPressed: () {
            fetchWeatherByCityNameFunction(cityName: searchController.text);
          },
          icon: const Icon(Icons.search_rounded),
        ),
      ],
    );
  }
}