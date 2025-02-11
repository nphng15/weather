import 'package:get/get.dart';

class WeatherController extends GetxController{
  var dailyWeatherForecast = [].obs;

  void updateForecastData(var newDailyWeatherForecast){
    dailyWeatherForecast.value = newDailyWeatherForecast;
  }
}