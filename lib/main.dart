import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/theme_provider.dart';
import 'package:untitled/Views/Screens/HomePage.dart';

import 'Views/Screens/DetailPage.dart';
import 'Views/Screens/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider(
        create: (context) => ThemeProvider(),
      ),
    ],
    builder: (context,child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepOrangeAccent,
      ),
      themeMode:       (Provider.of<ThemeProvider>(context).themeChange.isDark == false)
          ? ThemeMode.light
          : ThemeMode.dark,
      routes: {
        '/':(context) => SplashScreen(),
        'home':(context) => HomePage(),
        'detailpage':(context) => DetailPage(),
      },
    ),
  ));
}
