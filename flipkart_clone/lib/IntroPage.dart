import 'package:flipkart_clone/BMI.dart';
import 'package:flipkart_clone/Pass.dart';
import 'package:flipkart_clone/main.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var name= TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Intro Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome", style: TextStyle(fontSize: 24,),),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyHomePage();
                }));
              },
              child: Text("Next", style: TextStyle(color:Colors.black),),
            ),
            SizedBox(height: 80,),
            Text("Enter your name"),
            Container(width: 200, child: TextField(
              controller: name,
            )),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PassFunc(name.text.toString());
                }));
              },
              child: Text("Pass", style: TextStyle(color:Colors.black),),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return BMI();
                }));
              },
              child: Text("BMI", style: TextStyle(color:Colors.black),),
            )
          ],
        ),
      ),
    );
  }
  
}