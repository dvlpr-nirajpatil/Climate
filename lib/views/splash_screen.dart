import 'package:clima/controllers/weather_controller.dart';
import 'package:clima/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  changeScreen() {
    Future.delayed(Duration(seconds: 2), () async {
      await WeatherController().getHourWeeklyWeather();
      await WeatherController().getCurrentWeather();
      GoRouter.of(context).goNamed(HomeScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
