import 'package:flutter/material.dart';
import 'package:send_temps/constants.dart';
import 'package:send_temps/ui/components/custom_card.dart';
import 'package:send_temps/ui/components/icon_button.dart';
import 'package:send_temps/net/weather.dart';
import 'package:send_temps/ui/screens/weather_screen_current.dart';
import 'package:send_temps/ui/screens/weather_screen_historical.dart';
import 'package:send_temps/ui/screens/weather_screen_forecast.dart';

class HomeScreen extends StatefulWidget {
  final locationWeatherForecast;
  final locationWeatherHistorical;

  HomeScreen({this.locationWeatherForecast, this.locationWeatherHistorical});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // WeatherModel weather = WeatherModel(); // not need until I built getCurrentLocationWeather
  late int temperature;
  late String cityName;
  late dynamic locationWeatherForecast = widget.locationWeatherForecast;

  @override
  void initState() {
    super.initState();

    updateUI(locationWeatherForecast);
  }

  void updateUI(dynamic weatherData) {
    setState(
      () {
        if (weatherData == null) {
          temperature = 0;
          cityName = 'error';
          return;
        }
        double temp = weatherData['current']['temp_c'];
        temperature = temp.toInt();
        cityName = weatherData['location']['name'];
      },
    );
  }

  void pushToWeatherPage (String weatherScreenName) {

    Map screenNames = {
      'weatherScreenCurrent': WeatherScreenCurrent(locationWeather: locationWeatherForecast),
      'weatherScreenHistorical': WeatherScreenHistorical(locationWeather: locationWeatherForecast),
      'weatherScreenForecast': WeatherScreenForecast(locationWeather: locationWeatherForecast),
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return screenNames[weatherScreenName];
        },
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(childIcon: Icons.location_on),
                    CustomIconButton(childIcon: Icons.search),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: Text(
                      cityName,
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: CustomCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$temperature degrees', style: kCardTitleTextStyle),
                    ],
                  ),
                  tapCard: () => pushToWeatherPage('weatherScreenCurrent'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Last rain', style: kCardTitleTextStyle),
                            Text('>5 days', style: kCardBodyTextStyle),
                          ],
                        ),
                        tapCard: () => pushToWeatherPage('weatherScreenHistorical'),
                      ),
                    ),
                    Expanded(
                      child: CustomCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Next rain', style: kCardTitleTextStyle),
                            Text('2 days', style: kCardBodyTextStyle),
                          ],
                        ),
                        tapCard: () => pushToWeatherPage('weatherScreenForecast'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
