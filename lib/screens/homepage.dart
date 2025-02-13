import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //api
import 'package:intl/intl.dart'; //date format
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_weather/widgets/weather_item.dart';
import '../constants/color_constants.dart'; 
import 'package:get/get.dart';
import '../controller/weather_controller.dart';
import 'package:my_weather/routes/routes.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cityController = TextEditingController();
  WeatherController weatherController = Get.put(WeatherController());

  static String API_KEY = '9de8a43a987d4ab79b3140746252301';
  
  //Default Location
  String location = 'Thu Duc'; 
  String weatherIcon = 'heavycloud.png';
  int temperature = 0;
  int windSpeed = 0;
  int humidity = 0;
  int cloud = 0;
  String currentDate='';
  String currentWeatherStatus = 'Cloud';

  List hourlyWeatherForecast = [];
  List dailyWeatherForecast = [];

  //Call API
  String searchWeatherAPI= "https://api.weatherapi.com/v1/forecast.json?key=$API_KEY&days=7&q=";
  
  void fetchWeatherData(String searchText) async{
    try{
      var searchResult = await http.get(Uri.parse(searchWeatherAPI+ searchText));

      final weatherData = Map<String, dynamic>.from(json.decode(searchResult.body));

      var locationData = weatherData["location"];
      var currentWeather = weatherData["current"];

      setState(() {
          location = locationData["name"];
          
          //date
          var parsedDate = DateTime.parse(locationData["localtime"].substring(0,10));
          var newDate = DateFormat('MMMMEEEEd').format(parsedDate); //change date format
          currentDate = newDate;
          
          //update weather
          currentWeatherStatus = currentWeather['condition']['text'];
          weatherIcon = '${currentWeatherStatus.replaceAll(' ','').toLowerCase()}.png';
          temperature = currentWeather['temp_c'].toInt();
          windSpeed = currentWeather['wind_kph'].toInt();
          humidity = currentWeather['humidity'].toInt();
          cloud = currentWeather['cloud'].toInt();

          //forecast data
          dailyWeatherForecast = weatherData['forecast']['forecastday'];
          hourlyWeatherForecast = dailyWeatherForecast[0]['hour'];

          weatherController.updateForecastData(dailyWeatherForecast); 
      });
    } catch(err){//
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData(location);
  }

  @override
  Widget build(BuildContext context) {
    //lay kich thuoc man hinh tuy theo thiet bi
    Size size = MediaQuery.of(context).size; 
    Constants _constants = Constants();

    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(top: 70, left: 10, right:10),
        color: _constants.primaryColor.withOpacity(.1), //opacity
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: size.height * .7,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/menu.png", width: 40, height: 40),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/pin.png", width:20),
                            const SizedBox(width:2),
                            Text(location, style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            )),
                            IconButton(
                              onPressed: () {
                                _cityController.clear();
                                showMaterialModalBottomSheet(context: context, builder: (context)=> SingleChildScrollView(
                                  controller: ModalScrollController.of(context), //quản lí hành vi cuộn trong ListView
                                  child: Container(
                                    height: size.height * .7,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 70, 
                                          child: Divider( //tách từng item địa điểm
                                            thickness: 3.5,
                                            color: _constants.primaryColor,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        TextField(
                                          onChanged: (searchText){
                                            fetchWeatherData(searchText);
                                          },
                                          controller: _cityController,
                                          autofocus: true, 
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.search, color: _constants.primaryColor),
                                            suffixIcon: IconButton(
                                              onPressed: ()=> _cityController.clear(), 
                                              icon: Icon(Icons.close, color: _constants.primaryColor),
                                              ),
                                              hintText: 'Search city... e.g. Ha Noi,...',
                                              hintStyle: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.grey,
                                              ),
                                            focusedBorder: OutlineInputBorder( //trong trang thai focus phai su dung focusBorder
                                              borderSide: BorderSide(
                                                color: _constants.primaryColor,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            )
                                          ),
                                          
                                        ),
                                      ],
                                    ),
                                  )
                                ));
                              }, icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                            )   
                          ],
                        ),
                        ClipRRect( //cắt widget bên trong theo hình dạng (độ bo tròn) như ý muốn
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/profile.png", width: 40, height: 40),
                        )
                      ],
                  ),
                  SizedBox(
                    height: 160,
                    child: Image.asset("assets/$weatherIcon"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('$temperature',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = _constants.shader,
                        
                          ),
                        ),
                      ),
                      Text('o',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = _constants.shader
                          ),
                      ),
                    ],
                  ),
                  Text(currentWeatherStatus, 
                    style: TextStyle(
                      fontSize: 20,
                      color: _constants.secondaryColor,
                    ),
                  ),
                  Text('$currentDate', 
                    style: TextStyle(
                      fontSize: 20,
                      color: _constants.secondaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                      color: _constants.secondaryColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeatherItem(value: windSpeed, unit: 'km/h', imageUrl: 'assets/windspeed.png'),
                      WeatherItem(value: humidity, unit: '%', imageUrl: 'assets/humidity.png'),
                      WeatherItem(value: cloud, unit: '%', imageUrl: 'assets/cloud.png'),
                  ],)
                ],
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const Text('Today',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap:() => Get.toNamed(RoutesClass.forecast),
                  child: Text('Forecast', 
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: _constants.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _constants.primaryColor,  
                      ),  
                    )
                )
              ],),
            ),
            // SizedBox(height:5),
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(), //nảy lại khi cuộn tới rìa
                itemCount: 24,
                itemBuilder: (BuildContext context, int index){
                  //String forecastTime = dailyWeatherForecast[]
                  String currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
                  String currentHour = currentTime.substring(0,2);

                  String forecastHour = hourlyWeatherForecast[index]['time'].substring(11,13);
                  String forecastTime = hourlyWeatherForecast[index]['time'].substring(11,16);
                  
                  String forecastWeatherName = hourlyWeatherForecast[index]['condition']['text'];
                  String forecastWeatherIcon = '${forecastWeatherName.replaceAll(' ', '').toLowerCase()}.png';
                  String forecastTemperature = hourlyWeatherForecast[index]['temp_c'].round().toString();                
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.only(right: 20),
                    width: 65,
                    decoration: BoxDecoration(
                      color: currentHour == forecastHour ? Colors.black.withOpacity(0.5) : _constants.primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0,1),
                          blurRadius: 5,
                          color: _constants.primaryColor.withOpacity(.2),
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(forecastTime,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: _constants.greyColor,
                          )
                        ),
                        Image.asset('assets/$forecastWeatherIcon',width: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(forecastTemperature,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _constants.greyColor,
                            fontSize: 14,
                            )
                          ),
                          Text('o',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _constants.greyColor,
                            fontSize: 7,
                            )
                          ),
                        ],)
                      ],
                    ),
                  );
                }
              )
            )
          ],
        )
      )
    );
  }
}