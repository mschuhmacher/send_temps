import 'package:flutter/material.dart';

class WeatherScreenForecast extends StatelessWidget{

  final dynamic locationWeather;

  WeatherScreenForecast({required this.locationWeather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Forecast WeatherPage'),
      ),
    );

  }

}