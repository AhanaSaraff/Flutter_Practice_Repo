import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  var Controller1, Controller2;
  var result = "Result";

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            width: 300,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(

                  controller: Controller1,
                ),
                TextField(
                  controller: Controller2,
                ),
                Container(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(Controller1.text.toString());
                      var no2 = int.parse(Controller2.text.toString());

                      result = "Addition: ${no1 + no2}";
                      print("Called");

                      setState(() {

                      });
                    },
                        child: Text("+",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold ),)),
                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(Controller1.text.toString());
                      var no2 = int.parse(Controller2.text.toString());

                      result = "Substraction: ${no1 - no2}";
                      print("Called");

                      setState(() {

                      });
                    },
                        child: Text("-",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold ),)),
                    ElevatedButton(onPressed: (){
                    },
                        child: Text("*",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold ),)),
                    ElevatedButton(onPressed: (){},
                        child: Text("/",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold ),))
                  ],
                ),
                SizedBox(height: 50,),
                Text(result, style: TextStyle(fontSize: 30),)
              ],
            ),
          ),
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