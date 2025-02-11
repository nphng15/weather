import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import '../constants/color_constants.dart';
import '../widgets/main_forecast_card.dart';
import '../services/weather_repository.dart';

class ForecastPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
    Constants _constants = Constants();

    var dailyWeatherForecast = Get.arguments;
    var forecastData = getForecastWeather(dailyWeatherForecast, 0);

    print(getForecastWeather(dailyWeatherForecast, 0)['changeOfRain']);
    return Scaffold(
      backgroundColor: _constants.primaryColor,
      appBar: AppBar(
        backgroundColor: _constants.tertiaryColor,
        foregroundColor: Colors.white,
        title: const Text('Forecasts',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            ),
        ), 
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 5.0,
        ),
      body: Stack(
        // alignment: Alignment.center,
        // clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height*0.7,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70),
                ),
              ), 
            ),
          ),
          Align(
            child: Column(
              children: [
                MainForecastCard(
                  width: size.width*0.9,
                  height: size.height*0.4,
                  dailyWeatherForecast : dailyWeatherForecast,
                  weatherIcon : forecastData['weatherIcon'],
                  weatherName: forecastData['weatherName'],
                  avgTemp : forecastData['avgTemp'],
                  maxWindSpeed : forecastData['maxWindSpeed'],
                  avgHumidity : forecastData['avgHumidity'],
                  chanceOfRain : forecastData['chanceOfRain'],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}