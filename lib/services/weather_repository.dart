Map<String,dynamic> getForecastWeather(var dailyWeatherForecast, int index){
  String weatherIcon = dailyWeatherForecast[index]['day']['condition']['text'].replaceAll(' ','').toLowerCase() + '.png';
  String weatherName = dailyWeatherForecast[index]['day']['condition']['text'];
  int avgTemp = dailyWeatherForecast[index]['day']['avgtemp_c'].toInt();
  int maxWindSpeed = dailyWeatherForecast[index]['day']['maxwind_kph'].toInt();
  int avgHumidity = dailyWeatherForecast[index]['day']['avghumidity'].toInt();
  int chanceOfRain = dailyWeatherForecast[index]['day']['avghumidity'].toInt();

  return {
    'weatherIcon': weatherIcon,
    'weatherName': weatherName,
    'avgTemp': avgTemp,
    'maxWindSpeed': maxWindSpeed,
    'avgHumidity': avgHumidity,
    'chanceOfRain': chanceOfRain,
  };
}