import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'scroll_behavior.dart';
import 'package:get/get.dart';
import 'package:my_weather/routes/routes.dart';
void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Disable DevicePreview in release mode
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      initialRoute: RoutesClass.home,
      getPages: RoutesClass.routes,
      );
  }
}

