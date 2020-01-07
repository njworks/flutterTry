import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
    fontSize: 30.0, fontFamily: 'Spartan MB', color: Colors.lightBlueAccent);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const String apiKey = 'aa50f5e3996985913579e29266785e2f';
const String openWeatherLink =
    'https://api.openweathermap.org/data/2.5/weather';

const TextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter city name',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide.none));
