import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import '/screens/homepage.dart';
void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode, // Disable DevicePreview in release mode
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
    MyApp()
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      home: HomePage(),  
      );
  }
}

