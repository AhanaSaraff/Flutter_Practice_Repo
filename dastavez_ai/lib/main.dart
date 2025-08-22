import 'package:dastavez_ai/login.dart';
import 'package:dastavez_ai/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dastavez AI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1A1F2C),
          brightness: Brightness.dark,),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Future<bool> checkEmailExists(String email) async{
  //   final String apiUrl = "https://law-ai-7y05.onrender.com/auth/check-email";
  //
  //   try{
  //     final response = await http.post(
  //         Uri.parse(apiUrl),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //         body: jsonEncode(<String, String>{
  //           'email':email,
  //         }),
  //     );
  //
  //     if(response.statusCode == 200){
  //       final Map<String, dynamic> responseData = jsonDecode(response.body);
  //       return responseData["exists"]?? false;
  //     }else{
  //       print('Failed to check email: ${response.statusCode}');
  //       return false;
  //     }
  //   }catch(e){
  //     print('Error checking email: $e');
  //     return false;
  //   }
  // }
  
  Future<bool> checkEmail(String email) async{
    final url = Uri.parse('http://34.68.115.157:5000/auth/check-email');

    try{
      final response = await http.post(
        url,
        headers:{'Content-Type':'application/json'},
        body: jsonEncode({'email':email}),
      );

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        return data['exists'];
      }
      else{
        print('Server error: ${response.statusCode}');
        return false;
      }

    } catch(e){
      print('Error: $e');
      return false;
    }
  }

  var emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
            color: Color(0xFF1A1F2C),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    child: Row(
                      children: [
                        SizedBox(height: 25,),
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
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFF203354),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(80), topRight: Radius.circular(80)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Image.asset('assets/images/scales.png', width: 100, ),
                        SizedBox(height: 10,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("AI-Powered ", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                              Text("Legal Intelligence ", style: TextStyle(color: Color(0xFFDEBE21), fontSize: 25, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        SizedBox(height: 50,),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Enter your Email",

                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(30)
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        ElevatedButton(onPressed: () async {
                            var email = emailController.text.toString();
                            bool exists = await checkEmail(email);
                            if(exists){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return LogIn(email);
                              }));
                            }
                            else
                              {

                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return SignUP(email);
                                }));
                              }

                        },style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFDEBE21),
                          foregroundColor: Color(0xFF203354),
                        ) ,child: Container(
                          width: 90,
                          height: 40,
                            child: Center(child: Text("Proceed",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)))
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

        ),
    );
  }
}
