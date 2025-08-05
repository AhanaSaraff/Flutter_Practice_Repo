import 'dart:async';

import 'package:dastavez_ai/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ResetPassword extends StatefulWidget{

  var Email;
  var OTP;
  ResetPassword(this.Email, this.OTP);

  @override
  State<ResetPassword> createState() => _ResetPasswordState(Email, OTP);
}


class _ResetPasswordState extends State<ResetPassword> {

  var Email;
  var OTP;
  _ResetPasswordState(this.Email, this.OTP);

  var newPassword = TextEditingController();

  var confirmPassword = TextEditingController();

  Future<bool> resetPassword(String email, String otp, String newPassword, String confirmPassword) async{
    final url= Uri.parse("https://law-ai-7y05.onrender.com/auth/reset-password");

    final response = await http.post(
      url,
      headers: { "Content-Type": "application/json" },
      body: jsonEncode({
        "email":email,
        "otp": otp,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
      }),
    );

    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      return true;
    }
    else{
      return false;
    }
  }

  var result = "Process";

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
                    //New Password TextField
                    Container(
                      width: 300,
                      child: TextField(
                        controller: newPassword,
                        decoration: InputDecoration(
                            labelText: 'New Password',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    //Confirm Password TextField
                    Container(
                      width: 300,
                      child: TextField(
                        controller: confirmPassword,
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
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

                      var success = resetPassword(Email, OTP, newPassword.text.toString(), confirmPassword.text.toString());
                      if(await success){
                        setState(() {
                          result = "Password Changed Successfully";
                        });


                        Future.delayed(const Duration(seconds: 5),(){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return MyHomePage();
                          }));
                        });
                      }
                      else{
                        result="Something went wrong";

                      }



                    },style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDEBE21),
                      foregroundColor: Color(0xFF203354),
                    ) , child: Container(
                        width: 90,
                        height: 40,
                        child: Center(child: Text("Reset",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)))),

                    SizedBox(height: 20,),
                    // InkWell(
                    //   onTap: (){
                    //     Navigator.push(context, MaterialPageRoute(builder: (context){
                    //       return MyHomePage();
                    //     }));
                    //   },
                    //     child: Text("Home")),
                    Text(result)

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