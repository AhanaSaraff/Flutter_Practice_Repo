import 'package:dastavez_ai/Home.dart';
import 'package:dastavez_ai/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';



class SignUP extends StatefulWidget{
  var email;
  SignUP(this.email);
  @override
  State<SignUP> createState() {
    return Signup(email);
  }

}

class Signup extends State<SignUP>{

  var Email;
  Signup(this.Email);
  
  Future<bool> signUpUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String otp,
}) async {
    final url = Uri.parse("https://law-ai-7y05.onrender.com/auth/signup");
    final response = await http.post(
     url,
     headers: {"Content-Type": "application/json"},
     body: jsonEncode({
       "firstName": firstName,
       "lastName": lastName,
       "email":email,
       "password": password,
       "confirmPassword" : confirmPassword,
       "otp":otp,
     }) ,
    );

    if(response.statusCode == 200){
      final data= jsonDecode(response.body);
      print("Signup successful");
      print("Token: ${data['token']}");
      await saveToken(data['token']);
      return true;

    }else{
      print("Signup failed: ${response.body}");
      return false;
    }
  }

  Future<void> saveToken(String token) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
  }

  Future<String?> getToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }




  var FirstNameC= TextEditingController();
  var LastNameC = TextEditingController();
  var PasswordC = TextEditingController();
  var ConfirmPasswordC = TextEditingController();
  var OTPC = TextEditingController();


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
                    Container(
                      width: 300,
                      child: TextField(
                        controller: FirstNameC,
                        decoration: InputDecoration(
                            labelText: 'First Name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: LastNameC,
                        decoration: InputDecoration(
                            labelText: 'Last Name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 300,

                      child: TextField(
                        controller: PasswordC,
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
                    Container(
                      width: 300,
                      child: TextField(
                        controller: ConfirmPasswordC,
                        obscureText: true,
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
                    Container(
                      width: 300,
                      child: TextField(
                        controller: OTPC,
                        obscureText: true,
                        keyboardType: TextInputType.number,
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
                    ElevatedButton(onPressed: ()async{
                      var fName = FirstNameC;
                      var lName = LastNameC;
                      var pass = PasswordC;
                      var confirmPass = ConfirmPasswordC;
                      var Otp = OTPC;

                      bool success = await signUpUser(firstName: fName.text.toString(), lastName: lName.text.toString(), email: Email, password: pass.text.toString(), confirmPassword: confirmPass.text.toString(), otp: Otp.text.toString());

                      if(success){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return HomePage();
                        }));
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return MyHomePage();
                        }));
                      }

                    },style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDEBE21),
                      foregroundColor: Color(0xFF203354),
                    ) ,child: Container(
                        width: 90,
                        height: 40,
                        child: Center(child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),))))
          
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

