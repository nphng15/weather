// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class ForecastDayData {

  var weatherIcon=''.obs;
  var weatherName=''.obs;
  var avgTemp=0.obs; 
  var maxWindSpeed= 0.obs; 
  var avgHumidity= 0.obs; 
  var chanceOfRain= 0.obs;

  ForecastDayData({
    required int index,
    required var dailyWeatherForecast,
  }){
    weatherIcon.value = dailyWeatherForecast[index]['day']['condition']['text'].replaceAll(' ','').toLowerCase() + '.png';
    weatherName.value = dailyWeatherForecast[index]['day']['condition']['text'];
    avgTemp.value = dailyWeatherForecast[index]['day']['avgtemp_c'].toInt();
    maxWindSpeed.value = dailyWeatherForecast[index]['day']['maxwind_kph'].toInt();
    avgHumidity.value = dailyWeatherForecast[index]['day']['avghumidity'].toInt();
    chanceOfRain.value = dailyWeatherForecast[index]['day']['daily_chance_of_rain'].toInt();
  }
}
