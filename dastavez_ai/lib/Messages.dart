import 'package:dastavez_ai/Home.dart';
import 'package:dastavez_ai/Profile.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget{
  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  var currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("here messages will show"),
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
    else if(index == 0){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context){
    return HomePage();
    })
    );
    }
    },
    )
    );
  }
}