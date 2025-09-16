import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: MyCounter(),
    );
  }
}

class MyCounter extends StatefulWidget{
  @override
  State<MyCounter> createState() {
    return _MyCounterState();

  }

}

class _MyCounterState extends State<MyCounter>{

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: $count'),
            TextButton(onPressed: (){
              setState(() {
                count++;
              });
            }, child: Text('Increment'))
          ],
        ),
      ),
    );
  }

}

