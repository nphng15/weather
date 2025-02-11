// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart';
import '../widgets/weather_item.dart';

class MainForecastCard extends StatelessWidget {
  final double width;
  final double height;
  var dailyWeatherForecast;  

  String weatherIcon;
  String weatherName;
  int avgTemp;
  int maxWindSpeed;
  int avgHumidity;
  int chanceOfRain;

  Constants _constants = Constants();

  MainForecastCard({
    Key? key,
    required this.width,
    required this.height,
    required this.dailyWeatherForecast,
    required this.weatherIcon,
    required this.weatherName,
    required this.avgTemp,
    required this.maxWindSpeed,
    required this.avgHumidity,
    required this.chanceOfRain,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    return Container(
            width: width,
            height: height,
            margin: EdgeInsets.only(top:70),
            decoration: BoxDecoration(
            gradient: _constants.linearGradientLightBlue,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _constants.primaryColor.withOpacity(.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3)
              )
            ]
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(18),
                          child: SizedBox(
                            width: 150,
                            child: Image.asset('assets/$weatherIcon'),
                          ),
                        ),
                        Text('$weatherName',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _constants.secondaryColor,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 24),
                      child: Transform.translate(
                        offset: Offset(0,-20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('$avgTemp',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _constants.secondaryColor,
                              fontSize: 70,
                              )
                            ),
                            Text('o',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _constants.secondaryColor,
                              fontSize: 35,
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]
                ),
                SizedBox(height:50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WeatherItem(value: maxWindSpeed, unit: 'km/h', imageUrl:'assets/windspeed.png', width: 60, height: 60,),
                    WeatherItem(value: avgHumidity, unit: '%', imageUrl:'assets/humidity.png', width: 60, height: 60,),
                    WeatherItem(value: chanceOfRain, unit: '%', imageUrl:'assets/moderaterain.png',  width: 60, height: 60,),
                  ]
                ),
              ],
            ),
          );
  }
}
