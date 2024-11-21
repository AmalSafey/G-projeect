import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/assets/login/lofinbyfacebook.dart';
import 'package:flutter_application_graduation/assets/login/logindesign.dart';
import 'package:flutter_application_graduation/register/registerdesign.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: maincolor,
      home: AnimatedSplashScreen(
        backgroundColor: Color.fromARGB(255, 112, 182, 182),
        splashIconSize: 450,
        //rgba(112,182,189,255)
        splashTransition: SplashTransition.sizeTransition,
        splash: CircleAvatar(
          radius: double.infinity,
          backgroundImage:
              AssetImage('lib/assets/photo_5904657378991784728_y.jpg'),
        ),
        nextScreen: registerdesign(),
      ),
      routes: {
        Logindesign.routname: (context) => Logindesign(),
        registerdesign.routteName: (context) => registerdesign(),
        Logindesignfacebook.routname: (context) => Logindesignfacebook()
      },
    );
  }
}
/*
 MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          backgroundColor: Color.fromARGB(255, 136, 77, 61),
          splashIconSize: 450,
          splashTransition: SplashTransition.sizeTransition,
          splash: CircleAvatar(
            radius: double.infinity,
            backgroundImage: AssetImage('lib/photo1720238575 (2).jpeg'),
          ),*/