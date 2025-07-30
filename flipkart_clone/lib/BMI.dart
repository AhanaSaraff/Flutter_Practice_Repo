import 'package:flutter/material.dart';

class BMI extends StatefulWidget{


  @override
  State<BMI> createState() => BMI_Page();

}

class BMI_Page extends State<BMI>{
  
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var result = "Result will be shown here";

  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Tracker"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI", style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),),
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

                  if(ft!="" && wt!="" && inch!=""){
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iin = int.parse(inch);

                    var tinch = (ift*12) + iin;
                    var tcm = tinch*2.54;
                    var tM = tcm/100;

                    var bmi = iwt/(tM*tM);

                    setState(() {
                      result = "Bmi is ${bmi.toStringAsFixed(2)}";
                    });

                    if(bmi>=21 && bmi<30){
                      setState(() {
                        bgColor = Colors.lightGreen.shade200;
                      });

                    }
                    else{
                      setState(() {
                        bgColor = Colors.red.shade200;
                      });
                    }


                  }
                  else{
                    setState(() {
                      result = "Please fill all the required fields!!";
                    });
                  }

                }, child: Text("Calculate")),
                SizedBox(height: 30,),
                Text(result, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),)
              ],
            ),
          ),
        ),
      ),
    );
  }

}