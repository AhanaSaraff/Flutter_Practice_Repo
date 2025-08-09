import 'dart:convert';
import 'package:dastavez_ai/ResetPassword.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget{
  var Email;
  ForgotPassword(this.Email);
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState(Email);
}

class _ForgotPasswordState extends State<ForgotPassword> {

  var Email;
  _ForgotPasswordState(this.Email);

  var otp = TextEditingController();

  Future<bool> requestPasswordReset(String email) async{
    final url = Uri.parse("http://34.68.115.157:5000/auth/forgot-password");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email}),
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return true;
    }
    else{
      return false;
    }
  }

  var result = "Send OTP";

  Future<bool> verifyResetOTP(String email, String otp) async{
    final url = Uri.parse("http://34.68.115.157:5000/auth/verify-reset-otp");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "otp": otp}),
    );

    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      return true;
    }
    else{
      return false;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1A1F2C),
        child: SingleChildScrollView(
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
                height: 80,
              ),
              Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                    color: Color(0xFF203354),
                    borderRadius: BorderRadius.circular(70)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Send OTP InkWell
                    Container(
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 20,),
                          InkWell(
                            onTap: () async{
                              bool success = await requestPasswordReset(Email);
                              if(success){
                                setState(() {
                                  result="Resend Otp";
                                });
                              }
                              else{
                                result = "Failed to send OTP";
                              }
                            },
                            child: Text(result,style: TextStyle(fontSize: 15, color: Color(0xFF587BB7)),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    //OTP TextField
                    Container(
                      width: 300,
                      child: TextField(
                        controller: otp,
                        decoration: InputDecoration(
                            labelText: 'Enter OTP',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    //Proceed Button
                    ElevatedButton(onPressed: ()async{
                      bool success = await verifyResetOTP(Email, otp.text.trim());
                      if(success){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ResetPassword(Email, otp.text.trim());
                        }));
                      }
                      else{
                        print("invalid otp");
                      }


                    },style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDEBE21),
                      foregroundColor: Color(0xFF203354),
                    ) , child: Container(
                        width: 90,
                        height: 40,
                        child: Center(child: Text("Proceed",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),))))

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

      ),
    );
  }
}
