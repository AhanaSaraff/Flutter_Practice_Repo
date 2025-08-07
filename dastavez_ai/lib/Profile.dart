import 'package:dastavez_ai/Home.dart';
import 'package:dastavez_ai/Messages.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget{

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Color(0xFFDEBE21),),
                              Text("Premium", style: TextStyle(color: Color(0xFFDEBE21), fontSize: 18,),),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 15,),
                                    Container(
                                      width: 400,
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
                                                border: Border.all(color: Color(0xFFDEBE21)),
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFF2E3443),
                                                      spreadRadius: 2,
                                                  )
                                                ]
                                              ),
                                              child: Text("User Information", style: TextStyle(fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Container(
                                              width: double.infinity,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF203354),
                                                border: Border.all(color: Color(0xFFDEBE21)),
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFF2E3443),
                                                    spreadRadius: 2,
                                                  )
                                                ]
                                              ),
                                              child: Text("Account Settings", style: TextStyle(fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Container(
                                              width: double.infinity,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF203354),
                                                  border: Border.all(color: Color(0xFFDEBE21)),
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color(0xFF2E3443),
                                                        spreadRadius: 2,
                                                    )
                                                  ]
                                              ),
                                              child: Text("Usage Information", style: TextStyle(fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Container(
                                              width: double.infinity,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF203354),
                                                  border: Border.all(color: Color(0xFFDEBE21)),
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color(0xFF2E3443),
                                                        spreadRadius: 2,
                                                    )
                                                  ]
                                              ),
                                              child: Text("Upgrade", style: TextStyle(fontSize: 15),)),

                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              width: double.infinity,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF203354),
                                                  border: Border.all(color: Color(0xFFDEBE21)),
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xFF2E3443),
                                                      spreadRadius: 2,
                                                    )
                                                  ]
                                              ),
                                              child: Text("Logout", style: TextStyle(fontSize: 15),)),
                                          SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon:Icon(Icons.messenger_sharp), label:"Messages"),
        NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
      ],
        animationDuration: Duration(microseconds: 1000),
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index){
          setState((){
            currentPageIndex = index;
          },);
          if(index == 0){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return HomePage();
              })
            );
          }
          else if(index==1){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Messages();
            }));
          }
        },
      ),
    );
  }
}