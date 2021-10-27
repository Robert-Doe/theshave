import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnimatedSplashScreen(
        duration:1500,
        nextScreen: SecondScreen(),
        splash: Splash(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('images/logo.png',fit: BoxFit.fitWidth), 
        const Padding(padding: EdgeInsets.all(20.0),
        child: Text('Bob Cutz',style: 
        TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18.0),))],
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GeeksForGeeks")),
      body: Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}
