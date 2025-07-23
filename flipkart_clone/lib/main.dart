import 'package:flutter/material.dart';

void main(){
  runApp(const flipkartclone());
}

class flipkartclone extends StatelessWidget{
  const flipkartclone ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flipkart Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const MyHomePage(title: 'Flipkart Home'),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  class _MyHomePageState extends State<MyHomePage> {


    void callBack() {
      print("Hello");
    }

    @override
    Widget build(BuildContext context) {
      var arrColors = [
        Colors.blue,
        Colors.green,
        Colors.orange,
        Colors.cyan,
        Colors.grey,
        Colors.yellow,
        Colors.purple
      ];
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: RichText(text: TextSpan(
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey,
            ),
            children: <TextSpan>[
              TextSpan(text: ("Hello ")),
              TextSpan(text: ("World!!"), style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.blue
              ))


            ]
          )),
        )
        
      );
    }
  }



  // GridView.extent(maxCrossAxisExtent: 250,
  // crossAxisSpacing: 10,
  // mainAxisSpacing: 10,
  // children: [
  //   Container(color: arrColors[0],),
  //   Container(color: arrColors[1],),
  //   Container(color: arrColors[2],),
  //   Container(color: arrColors[3],),
  //   Container(color: arrColors[4],),
  //   Container(color: arrColors[5],),
  //   Container(color: arrColors[6],),
  // ],)
  // );
  // }
  // }




// Center(
// child: Container(
// width: 600,
// height: 500,
// child: GridView.count(crossAxisCount: 4,
//
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrColors[0],height: 100),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrColors[1],height: 100),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrColors[2],height: 100),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrColors[3],height: 100),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrColors[4],height: 100),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrColors[5],height: 100),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrColors[6],height: 100),
// ),
// ],
// ),
// ),