import 'package:flutter/material.dart';
import 'package:food_app_flutter/pages/StartPage.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(fontFamily: 'Roboto'),
    debugShowCheckedModeBanner: false,
    home: StartPage(),
  )
);
