import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logics/weather_by_location_bloc/weather_by_location_bloc.dart';
import '../../weather_detail_page/weather_detail_page.dart';

class WeatherPlaceNameComponent extends StatelessWidget {

  final double lat;
  final double lon;
  final String cityName;

  const WeatherPlaceNameComponent({
    super.key,
    required this.lat,
    required this.lon,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const WeatherDetailsPage(),
          ));
        },
        icon: const Icon(Icons.search),
      ),
      title: Text(
        "📍 $cityName",
        style: const TextStyle(
          color: Colors.indigo,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        onPressed: () {
          context
              .read<WeatherByLocationBloc>()
              .add(FetchWeatherByLocationEvent(lat: lat, lon: lon));
        },
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}