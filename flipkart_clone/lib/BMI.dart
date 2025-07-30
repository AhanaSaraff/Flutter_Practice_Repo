import 'package:flutter/material.dart';

class BMI extends StatefulWidget{


  @override
  State<BMI> createState() => BMI_Page();

}

class BMI_Page extends State<BMI>{
  
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Tracker"),
      ),
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BMI", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
              SizedBox(height: 50,),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text("Enter your weight(in Kgs)"),
                  prefixIcon: Icon(Icons.line_weight)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20,),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                    label: Text("Enter your height(in feet)"),
                    prefixIcon: Icon(Icons.height_rounded)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20,),
              TextField(
                controller: inchController,
                decoration: InputDecoration(
                    label: Text("Enter your height(in inches)"),
                    prefixIcon: Icon(Icons.height_rounded)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: (){
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inchController.text.toString();

              }, child: Text("Calculate")),
              Text("")
            ],
          ),
        ),
      ),
    );
  }

}