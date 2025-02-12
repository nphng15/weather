import 'package:get/get.dart';
import 'package:my_weather/screens/forecast_page.dart';
import 'package:my_weather/screens/homepage.dart';

class RoutesClass{
  //static de goi ko can tao object
  static String home = '/home';
  static String forecast = '/forecast';

  static List<GetPage> routes = [
    GetPage(page:()=> const HomePage(), name: home),
    GetPage(page:()=> const ForecastPage(), name: forecast),
  ];
}