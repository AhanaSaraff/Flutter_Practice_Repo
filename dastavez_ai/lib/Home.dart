import 'package:dastavez_ai/Profile.dart';
import 'package:dastavez_ai/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          color: Color(0xFF1A1F2C),
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is the home page of the Dastavez_AI", style: TextStyle(fontSize: 30, color: Color(0xFFDEBE21)),),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyHomePage();
                }));
              },style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDEBE21),
                foregroundColor: Color(0xFF1A1F2C),
              ) ,child: Text("Go Back")),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Profile();
                }));
              },style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDEBE21),
                foregroundColor: Color(0xFF1A1F2C),
              ) ,child: Text("View Profile")),

            ],
          ))),
    );
  }

}
