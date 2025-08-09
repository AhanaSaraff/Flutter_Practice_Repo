import 'package:dastavez_ai/ForgotPassword.dart';
import 'package:dastavez_ai/Home.dart';
import 'package:dastavez_ai/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class LogIn extends StatefulWidget{
  var Email;
  LogIn(this.Email);
  @override
  State<LogIn> createState() {
    return login(Email);
  }

}

class login extends State<LogIn>{


  var Email;
  login(this.Email);

  

  @override
  Widget build(BuildContext context) {

    Future<bool> loginUser(String email, String password) async{
      final url = Uri.parse("http://34.68.115.157:5000/auth/login");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if(response.statusCode==200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', token);

        return true;
      }
      else{
        final error = jsonDecode(response.body);
        print(error['message'] ?? "Login failed");
        return false;

      }
    }


    var Password = TextEditingController();

    return Scaffold(
      body: Expanded(
        child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 300,
                          child: TextField(
                            controller: Password,
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
                        ElevatedButton(onPressed: () async{
            
                          var success = loginUser(Email, Password.text.toString());
            
                          if(await success){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return HomePage();
                            }));
                          }
                          else{
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return MyHomePage();
                            }));
            
                          }
            
            
            
                          print("pressed");
                    
                        },style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFDEBE21),
                          foregroundColor: Color(0xFF203354),
                        ) ,child: Container(
                            width: 90,
                            height: 40,
                            child: Center(child: Text("Login",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)))),


                        Container(
                          height: 150,
                          width: 500,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ForgotPassword(Email);
                                  }));
                                },
                                child: Text("Forgot Password",style: TextStyle(fontSize: 15, color: Color(0xFF587BB7)),),
                              ),

                              SizedBox(height: 30,)
                            ],
                          ),
                        )
                    
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
      ),
    );
  }

}