import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart';
import '../widgets/main_forecast_card.dart';
import '../widgets/mini_forecast_card.dart';
import  '../controller/mainCard_controller.dart';
class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
    Constants _constants = Constants();

    mainCardController mainCard = Get.put(mainCardController());

    // var dailyWeatherForecast = weatherController.dailyWeatherForecast;
    // var forecastData = getForecastWeather(dailyWeatherForecast, 0);

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
          Obx(()=>
            Align(
              child: Column(
                children: [
                  MainForecastCard(index: mainCard.mainIndex.value),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.4,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.zero,//bo padding
                        title: MiniForecastCard(index: index, mainIndex: mainCard.mainIndex.value),
                        onTap: () => mainCard.changeIndex(index),
                      ),
                    ),
                  ),      
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}