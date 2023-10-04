import 'package:flutter/material.dart';
import 'package:untitled/Views/Screens/HomePage.dart';

import 'Views/Screens/DetailPage.dart';
import 'Views/Screens/splash_screen.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.deepOrangeAccent,
    ),
    routes: {
      '/':(context) => SplashScreen(),
      'home':(context) => HomePage(),
      'detailpage':(context) => DetailPage(),
    },
  ));
}