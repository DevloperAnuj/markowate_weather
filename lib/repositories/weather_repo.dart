
import 'package:http/http.dart' as http;
import 'package:markowate_weather/models/Weather/weather_response_model.dart';

class WeatherRepository {

  final String _apiKey = '8107846c361d8e7c3fcebdb130e590d2';

  Future<WeatherModel> searchWeatherByCity({required String city}) async {
    try {
      final http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$_apiKey"));
      if (response.statusCode == 200) {
        print(response.body);
        final weatherData = weatherModelFromMap(response.body);
        return weatherData;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<WeatherModel> searchWeatherByCoordinates(
      {required double lat, required double lon}) async {
    try {
      final http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$_apiKey"));
      if (response.statusCode == 200) {
        print(response.body);
        final weatherData = weatherModelFromMap(response.body);
        return weatherData;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
