import '../net/get_location.dart';
import '../net/networking.dart';
import 'package:intl/intl.dart';


const openWeatherMapApiKey = 'caa9a164eb8fb518d0484b380f059bdb';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
// var openWeatherMapUri = Uri.parse('$openWeatherMapURL?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$openWeatherMapApiKey&units=metric');

const weatherApiApiKey = '90114bedf2be4b869ad231431202812';
const weatherApiURLHistorical = 'http://api.weatherapi.com/v1/history.json';
const weatherApiURLForecast = 'http://api.weatherapi.com/v1/forecast.json';

DateTime now = new DateTime.now();
DateTime currentDate = new DateTime(now.year, now.month, now.day);
DateTime threeDaysAgo = currentDate.subtract(const Duration(days: 3));
var formatter = new DateFormat('yyyy-mm-dd');
String formattedCurrentDate = formatter.format(currentDate);
String formattedThreeDaysAgo = formatter.format(threeDaysAgo);



class WeatherModel {

  Future<dynamic> getLocationForecastWeather() async {
    // Forecast API call includes current weather + forecasted weather
    Location myLocation = Location();
    await myLocation.getCurrentLocation();

    String q = ('${myLocation.latitude},${myLocation.longitude}');
    var weatherApiForecastUri = Uri.parse('$weatherApiURLForecast?key=$weatherApiApiKey&q=$q&days=3&aqi=yes&alerts=no');

    NetworkHelper networkHelper = NetworkHelper(weatherApiForecastUri);
    var weatherDataForecast = await networkHelper.getData();

    return weatherDataForecast;
  }

  Future<dynamic> getLocationHistoricalWeather() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();

    String q = ('${myLocation.latitude},${myLocation.longitude}');
    var weatherApiHistoricalUri = Uri.parse('$weatherApiURLHistorical?key=$weatherApiApiKey&q=$q&dt=$formattedThreeDaysAgo&end_dt$formattedCurrentDate');

    NetworkHelper networkHelper = NetworkHelper(weatherApiHistoricalUri);
    var weatherDataHistorical = await networkHelper.getData();

    return weatherDataHistorical;
  }

}
