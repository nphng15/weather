// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather/Models/weather_forecast_day.dart';
import 'package:my_weather/controller/weather_controller.dart';
import '../constants/color_constants.dart';

class MiniForecastCard extends StatelessWidget {
  
  WeatherController weatherController = Get.find();
  late ForecastDayData forecastDayData;

  Constants _constants = Constants();

  int index;

  MiniForecastCard({
    Key? key,
    required this.index,
  }) : super(key: key){
    forecastDayData = ForecastDayData(index: index, dailyWeatherForecast: weatherController.dailyWeatherForecast);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.amber,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.09,
        decoration: BoxDecoration(
          color: _constants.greyColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: _constants.blackColor.withOpacity(0.5),
              blurRadius: 2,
              offset: Offset(0,3),
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${forecastDayData.forecastDate}',
                    style: TextStyle(
                      color: _constants.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Image.asset('assets/${forecastDayData.weatherIcon}',width: 30, height: 30,),
                      SizedBox(width: 5,),
                      Text('${forecastDayData.weatherName}',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 12,
                        ),
                        
                      )
                  ],)
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text('${forecastDayData.minTemp}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _constants.blackColor.withOpacity(0.3),
                            fontSize: 18,
                            )
                          ),
                          Text('o',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _constants.blackColor.withOpacity(0.3),
                            fontSize: 9,
                            )
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        
                        color: Colors.black,
                        thickness: 5,
                        width: 5,
                      ),
                      Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text('${forecastDayData.maxTemp}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _constants.blackColor,
                                fontSize: 18,
                                )
                              ),
                              Text('o',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _constants.blackColor,
                                fontSize: 9,
                                )
                              ),
                            ],
                          ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${forecastDayData.sunsetTime}',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 12,
                          ),
                      ),
                      VerticalDivider(
                        width: 5,
                      ),
                      Image.asset('assets/sunset.png', width: 30, height: 30,)
                    ],
                  ),
                ],
              )
            ),
          ],
        ),      
      ),
    );
  }
}
