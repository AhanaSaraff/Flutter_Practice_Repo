import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                
                decoration: BoxDecoration(
                  color: Color(0xFF1A1F2C),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50))
                ),
                child: Expanded(
                  child: Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),
                          CircleAvatar(
                            radius: 70.0,
                            backgroundImage: AssetImage('assets/images/profile.jpg'),
                          ),
                          SizedBox(height: 20,),
                          Text("Ahana Saraff", style: TextStyle(color: Colors.white, fontSize: 25,),),
                          Text("ahanasaraff@gmail.com", style: TextStyle(color: Colors.white, fontSize: 15,),),
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
            
                                children: [
                                  SizedBox(height: 30,),
                                  Text("General", style: TextStyle(fontSize: 17),),
                                  SizedBox(height: 15,),
                                  Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: double.infinity,
                                            height: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF203354),
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xFF2E3443),
                                                    spreadRadius: 2,
                                                )
                                              ]
                                            ),
                                            child: Text("Edit Profile", style: TextStyle(fontSize: 15),)),
                                        SizedBox(height: 10,),
                                        Container(
                                            width: double.infinity,
                                            height: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF203354),
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xFF2E3443),
                                                  spreadRadius: 2,
                                                )
                                              ]
                                            ),
                                            child: Text("Change Password", style: TextStyle(fontSize: 15),)),
                                        SizedBox(height: 10,),
                                        Container(
                                            width: double.infinity,
                                            height: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF203354),
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color(0xFF2E3443),
                                                      spreadRadius: 2,
                                                  )
                                                ]
                                            ),
                                            child: Text("Notification", style: TextStyle(fontSize: 15),)),
                                        SizedBox(height: 10,),
                                        Container(
                                            width: double.infinity,
                                            height: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF203354),
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color(0xFF2E3443),
                                                      spreadRadius: 2,
                                                  )
                                                ]
                                            ),
                                            child: Text("Subscription", style: TextStyle(fontSize: 15),)),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }

}