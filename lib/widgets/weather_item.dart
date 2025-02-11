// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  int value;
  String unit;
  String imageUrl;

  WeatherItem({
    Key? key,
    required this.value,
    required this.unit,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Image.asset("$imageUrl", width: 40, height: 40,),
              Text('$value$unit', 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 16, 
                  fontWeight: FontWeight.bold
                ),
              )
            ]
          );
  }
}
