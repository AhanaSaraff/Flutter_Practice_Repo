import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LogIn extends StatefulWidget{
  @override
  State<LogIn> createState() {
    return login();
  }

}

class login extends State<LogIn>{




  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1A1F2C),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    Image.asset('assets/images/scales.png'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Dastavez ", style: TextStyle(color: Color(0xFFDEBE21), fontSize: 20),),
                            Text("AI", style: TextStyle(color: Colors.white, fontSize: 20),),
                          ],
                        ),
                        Text("Powered Legal Intelligence", style: TextStyle(fontSize: 10),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
                width: 600,
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xFF203354),
                  borderRadius: BorderRadius.circular(70)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    ElevatedButton(onPressed: (){

                    },style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDEBE21),
                      foregroundColor: Color(0xFF203354),
                    ) ,child: Container(
                        width: 90,
                        height: 40,
                        child: Center(child: Text("Login",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),))))

                  ],

                ),
              ),
            Container(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('AI-Powered ', style: TextStyle(color: Colors.white, fontSize: 20),),
                  Text('Legal Intelligence', style: TextStyle(color: Color(0xFF405F95), fontSize: 20),),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }

}