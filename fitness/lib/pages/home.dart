import 'package:fitness/services/support_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() {
    return _Home();
  }

}

class _Home extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text("Hi, Jane", style: AppWidget.headlineTextstyle(20.0),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}