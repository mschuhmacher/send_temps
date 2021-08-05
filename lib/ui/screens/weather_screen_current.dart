import 'package:flutter/material.dart';

class WeatherScreenCurrent extends StatelessWidget{

  final dynamic locationWeather;

  WeatherScreenCurrent({required this.locationWeather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Current WeatherPage'),
      ),
    );

  }

}