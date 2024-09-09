import 'dart:convert';

import 'package:clima/main.dart';
import 'package:clima/models/current_weather_data_model.dart';
import 'package:clima/models/weather_data_model.dart';
import 'package:clima/services/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherApis {
  static WeatherApis instance = WeatherApis.internal();
  WeatherApis.internal();
  factory WeatherApis() => instance;

  String apikey = "1ef45e729cd06b8a0a29b16df2dc4e79";

  Future<WeatherDataModel?> getHourWeeklyWeatherRequest() async {
    Position? position = LocationService().position;
    if (position == null) return null;

    Uri url = Uri.parse(
        "https://api.openweathermap.org/data/3.0/onecall?lat=${position.latitude}&lon=${position.longitude}&exclude={part}&appid=$apikey&units=metric");

    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        logger.d(data);
        return WeatherDataModel.fromJson(data);
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }

  getCurrentWeather() async {
    Position? position = LocationService().position;
    if (position == null) return null;
    Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apikey&units=metric");

    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        logger.d(data);
        return CurrentWeatherDataModel.fromJson(data);
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
