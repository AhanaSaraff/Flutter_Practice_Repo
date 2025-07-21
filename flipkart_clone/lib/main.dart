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

  class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context){
  return Scaffold(
  appBar: AppBar(
  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  title: Text(widget.title),
  ),
  body: Center()
  );
  }
  }
