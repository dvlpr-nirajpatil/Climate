import 'package:clima/models/current_weather_data_model.dart';
import 'package:clima/models/weather_data_model.dart';
import 'package:clima/requests/weather_apis.dart';
import 'package:flutter/material.dart';

class WeatherController extends ChangeNotifier {
  static WeatherController instance = WeatherController.internal();
  WeatherController.internal();
  factory WeatherController() => instance;

  WeatherDataModel? weatherData;
  CurrentWeatherDataModel? currentData;

  getHourWeeklyWeather() async {
    weatherData = await WeatherApis().getHourWeeklyWeatherRequest();
  }

  getCurrentWeather() async {
    currentData = await WeatherApis().getCurrentWeather();
  }
}
