import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:send_temps/net/weather.dart';
import 'package:send_temps/ui/screens/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherDataForecast = await WeatherModel().getLocationForecastWeather();
    var weatherDataHistorical = await WeatherModel().getLocationHistoricalWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen(
            locationWeatherForecast: weatherDataForecast,
            locationWeatherHistorical: weatherDataHistorical,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingPlain(
          color: Colors.blueGrey,
          size: 100.0,
        ),
      ),
    );
  }
}
