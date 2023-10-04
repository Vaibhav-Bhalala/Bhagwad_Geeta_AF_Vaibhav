import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return Scaffold(backgroundColor: Color(0xfff58300).withOpacity(0.7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("Assets/bhagwadgeetasplash.gif"),
                    fit: BoxFit.cover),
                boxShadow: [BoxShadow(offset: Offset(6,8),color: Colors.black.withOpacity(0.4))]
              ),
            ),
            SizedBox(height: 25,),
            Text(
              "BHAGWAD GEETA 📖 ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red.withOpacity(0.6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
