// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ForecastDayData {

  var weatherIcon=''.obs;
  var weatherName=''.obs;
  var forecastDate = ''.obs;
  var sunsetTime = ''.obs;
  var avgTemp=0.obs; 
  var maxTemp=0.obs;
  var minTemp=0.obs;
  var maxWindSpeed= 0.obs; 
  var avgHumidity= 0.obs; 
  var chanceOfRain= 0.obs;

  ForecastDayData({
    required int index,
    required var dailyWeatherForecast,
  }){
    var parsedDate = DateTime.parse(dailyWeatherForecast[index]['date']);
    var newDate = DateFormat('MMMMEEEEd').format(parsedDate); //change date format
    forecastDate.value = newDate;
    weatherIcon.value = dailyWeatherForecast[index]['day']['condition']['text'].replaceAll(' ','').toLowerCase() + '.png';
    weatherName.value = dailyWeatherForecast[index]['day']['condition']['text'];
    sunsetTime.value = dailyWeatherForecast[index]['astro']['sunset'];
    avgTemp.value = dailyWeatherForecast[index]['day']['avgtemp_c'].toInt();
    maxTemp.value = dailyWeatherForecast[index]['day']['maxtemp_c'].toInt();
    minTemp.value = dailyWeatherForecast[index]['day']['mintemp_c'].toInt();
    maxWindSpeed.value = dailyWeatherForecast[index]['day']['maxwind_kph'].toInt();
    avgHumidity.value = dailyWeatherForecast[index]['day']['avghumidity'].toInt();
    chanceOfRain.value = dailyWeatherForecast[index]['day']['daily_chance_of_rain'].toInt();
  }
}
