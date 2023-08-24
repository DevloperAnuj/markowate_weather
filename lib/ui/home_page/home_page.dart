import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:markowate_weather/ui/weather_detail_page/weather_detail_page.dart';
import '../../logics/getting_device_location_cubit/getting_device_location_cubit.dart';
import '../../logics/weather_by_location_bloc/weather_by_location_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocConsumer<GettingDeviceLocationCubit, GettingDeviceLocationState>(
        listener: (context, state) {
          if (state is GettingDeviceLocationFetched) {
            print("${state.lon}=${state.lat}");
            context.read<WeatherByLocationBloc>().add(
                FetchWeatherByLocationEvent(lat: state.lat, lon: state.lon));
          }
        },
        builder: (context, locState) {
          if (locState is GettingDeviceLocationLoading) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffF5F5F5),
                    Color(0xff004FEA),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/anims/locfec.json"),
                    const Text(
                      "Wait...Fetching Your Location !",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          } else if (locState is GettingDeviceLocationFetched) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff6CA2FC),
                    Color(0xffedeff2),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: BlocBuilder<WeatherByLocationBloc, WeatherByLocationState>(
                builder: (context, state) {
                  if (state is WeatherByLocationLoading) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/anims/winder.json"),
                          const Text(
                            "Fetching Weather...",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  } else if (state is WeatherByLocationError) {
                    return const Center(
                      child: Icon(
                        Icons.error,
                        size: 100,
                        color: Colors.red,
                      ),
                    );
                  } else if (state is WeatherByLocationFetched) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                    const WeatherDetailsPage(),
                              ));
                            },
                            icon: const Icon(Icons.search),
                          ),
                          title: Text(
                            "📍 ${state.weatherModel.name}",
                            style: const TextStyle(
                              color: Colors.indigo,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              context.read<WeatherByLocationBloc>().add(
                                  FetchWeatherByLocationEvent(
                                      lat: locState.lat, lon: locState.lon));
                            },
                            icon: const Icon(Icons.refresh),
                          ),
                        ),
                        Text(
                          formatDate(DateTime.now(),["Date: ",dd, '-', mm, '-', yyyy," Time:",hh,":",nn]),
                          style: TextStyle(
                            color: Colors.indigoAccent.shade200,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            color: const Color(0xff004FEA),
                            semanticContainer: true,
                            elevation: 9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${state.weatherModel.main.temp.round()}"
                                  "\u2103",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 85,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Lottie.asset(
                                        "assets/anims/weat.json",
                                        fit: BoxFit.cover,
                                        width: 150,
                                      ),
                                      Expanded(
                                        child: Text(
                                          state.weatherModel.weather.first
                                              .description,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w100,
                                          ),
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            color: Colors.white,
                            semanticContainer: true,
                            elevation: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.water_drop_rounded,
                                        color: Color(0xff004FEA),
                                        size: 35,
                                      ),
                                      Text(
                                        "${state.weatherModel.main.humidity}"
                                        "%",
                                        style: const TextStyle(
                                          color: Color(0xff004FEA),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                      const Text(
                                        "Humidity",
                                        style: TextStyle(
                                          color: Color(0xff004FEA),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.wind_power_outlined,
                                        color: Color(0xff004FEA),
                                        size: 35,
                                      ),
                                      Text(
                                        "${state.weatherModel.wind.speed}"
                                        "m/s",
                                        style: const TextStyle(
                                          color: Color(0xff004FEA),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                      const Text(
                                        "Wind Speed",
                                        style: TextStyle(
                                          color: Color(0xff004FEA),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.cloud_circle,
                                        color: Color(0xff004FEA),
                                        size: 35,
                                      ),
                                      Text(
                                        "${state.weatherModel.clouds.all}" "%",
                                        style: const TextStyle(
                                          color: Color(0xff004FEA),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                      const Text(
                                        "Cloudiness",
                                        style: TextStyle(
                                          color: Color(0xff004FEA),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
