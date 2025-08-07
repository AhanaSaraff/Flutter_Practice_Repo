import 'package:dastavez_ai/Messages.dart';
import 'package:dastavez_ai/Profile.dart';
import 'package:dastavez_ai/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1A1F2C),
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

        if(index == 2){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return Profile();
            })
          );
        }
        else if(index == 1){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return Messages();
              })
          );
        }
        },
      ),
    );
  }
}
