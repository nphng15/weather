// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';

class MainForecastCard extends StatelessWidget {
  final double width;
  final double height;
  var dailyWeatherForecast;  

  String weatherIcon;
  int temp;
  int windSpeed = 0;
  int humidity = 0;
  int cloud = 0;

  Constants _constants = Constants();

  MainForecastCard({
    Key? key,
    required this.width,
    required this.height,
    required this.dailyWeatherForecast,
    required this.weatherIcon,
    required this.temp,
    required this.windSpeed,
    required this.humidity,
    required this.cloud,
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
              
            ),
          );
  }
}
