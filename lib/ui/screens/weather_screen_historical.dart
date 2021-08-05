import 'package:flutter/material.dart';

class WeatherScreenHistorical extends StatelessWidget{

  final dynamic locationWeather;

  WeatherScreenHistorical({required this.locationWeather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Historic WeatherPage'),
      ),
    );

  }

}