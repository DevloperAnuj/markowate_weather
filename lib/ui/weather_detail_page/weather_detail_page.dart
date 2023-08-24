import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../logics/weather_by_city_search_bloc/weather_by_city_search_bloc.dart';

class WeatherDetailsPage extends StatefulWidget {
  const WeatherDetailsPage({super.key});

  @override
  State<WeatherDetailsPage> createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherByCitySearchBloc>(
      lazy: true,
      create: (context) => WeatherByCitySearchBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: TextField(
              controller: searchController,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<WeatherByCitySearchBloc>().add(
                        WeatherRequestCalledByCityName(
                            cityName: searchController.text),
                      );
                },
                icon: const Icon(Icons.search_rounded),
              ),
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
            child: SingleChildScrollView(
              child: BlocBuilder<WeatherByCitySearchBloc,
                  WeatherByCitySearchState>(
                builder: (context, state) {
                  if (state is WeatherByCitySearchInitial) {
                    return const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.search_rounded,
                              size: 150,
                              color: Colors.indigoAccent,
                            ),
                            Text(
                              "Get Weather by City Name !",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (state is WeatherByCitySearchLoading) {
                    return Center(
                        child: Lottie.asset("assets/anims/loc_blue.json"));
                  } else if (state is WeatherByCitySearchFetched) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "📍 ${state.weatherModel.name}",
                          style: const TextStyle(
                            color: Colors.indigo,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
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
                                  "${state.weatherModel.main.temp.round()}" "\u2103",
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
                          padding: EdgeInsets.all(20.0),
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
                  } else if (state is WeatherByCitySearchError) {
                    return const Center(
                      child: Icon(
                        Icons.error,
                        size: 150,
                        color: Colors.red,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}

/*

if(state is WeatherByCitySearchInitial){

}else if(state is WeatherByCitySearchLoading){

}else if(state is WeatherByCitySearchFetched){

}else if(state is WeatherByCitySearchError){

}

 */
