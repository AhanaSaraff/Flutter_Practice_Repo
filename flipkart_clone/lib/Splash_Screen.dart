import 'dart:async';

import 'package:flipkart_clone/IntroPage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();


    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return IntroPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(child: Text("Classico", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white))),
      ),
    );
  }
}