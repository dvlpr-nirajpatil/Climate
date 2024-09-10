import 'package:clima/Model/current_weather_data_model.dart';
import 'package:clima/Model/whether_data_model.dart';
import 'package:clima/requests/weather_apis.dart';
import 'package:flutter/material.dart';

class WeatherController extends ChangeNotifier {
  static WeatherController instance = WeatherController.internal();
  WeatherController.internal();
  factory WeatherController() => instance;

  WhetherDataModel? weatherData;
  CurrentWeatherDataModel? currentData;

  getHourWeeklyWeather() async {
    weatherData = await WeatherApis().getHourWeatherRequest();
  }

  getCurrentWeatherr() async {
    currentData = await WeatherApis().getCurrentWeather();
  }
}
