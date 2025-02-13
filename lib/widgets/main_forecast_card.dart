// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/weather_forecast_day.dart';
import '../constants/color_constants.dart';
import '../controller/weather_controller.dart';
import '../widgets/weather_item.dart';

class MainForecastCard extends StatelessWidget {
  WeatherController weatherController = Get.find();
  late ForecastDayData forecastDayData;
  // late ForecastDayData data = ForecastDayData(index: 0, dailyWeatherForecast: weatherController.dailyWeatherForecast).obs as ForecastDayData;
// Chuyển weatherForecastData thành Rx object
  // Rx<ForecastDayData?> weatherForecastData = Rx<ForecastDayData?>(null);

  final Constants _constants = Constants();

  int index;

  MainForecastCard({
    Key? key,
    required this.index,
  }) : super(key: key){
    forecastDayData = ForecastDayData(index: index, dailyWeatherForecast: weatherController.dailyWeatherForecast);
    // weatherForecastData.value = ForecastDayData(index: index, dailyWeatherForecast: weatherController.dailyWeatherForecast);
    // data= ForecastDayData(index: 0, dailyWeatherForecast: weatherController.dailyWeatherForecast).obs a;
    // ForecastDayData weatherForecastData = ForecastDayData(
    //   index: index, 
    //   dailyWeatherForecast : weatherController.dailyWeatherForecast.value
    // );
  }


  
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.4,
              margin: EdgeInsets.only(top:40),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(18),
                            child: SizedBox(
                              width: 100,
                              child: Image.asset('assets/' + forecastDayData.weatherIcon.value,),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text('${forecastDayData.weatherName.value}',
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _constants.secondaryColor,
                              ),
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
                              Text('${forecastDayData.avgTemp.value}',
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
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.5, 
                    child: Divider( //tách từng item địa điểm
                      color: _constants.secondaryColor,
                      
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WeatherItem(value: forecastDayData.maxWindSpeed.value, unit: 'km/h', imageUrl:'assets/windspeed.png', width: 50, height: 50,),
                      WeatherItem(value: forecastDayData.avgHumidity.value, unit: '%', imageUrl:'assets/humidity.png', width: 50, height: 50,),
                      WeatherItem(value: forecastDayData.chanceOfRain.value, unit: '%', imageUrl:'assets/moderaterain.png',  width: 50, height: 50,),
                    ]
                  ),
                ],
              ),
            ),
    );
  }
}
