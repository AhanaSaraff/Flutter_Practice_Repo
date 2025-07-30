import 'package:flutter/material.dart';

class PassFunc extends StatefulWidget{

  var PassedName;
  PassFunc(this.PassedName);

  @override
  State<PassFunc> createState() => _PassFuncState();
}

class _PassFuncState extends State<PassFunc> {
  RangeValues values = RangeValues(0, 1);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      appBar: AppBar(title: Text("Hi"),),
        body: Container(
          color: Colors.deepPurple,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello ${widget.PassedName}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),),
              Container(
                color: Colors.white,
                child: RangeSlider(values: values,
                    labels: labels,
                    divisions: 10,
                    onChanged: (newvalue){
                        values = newvalue;
                        setState((){
                            print("${newvalue.start} ${newvalue.end}");
                        });

                    }),
              )
            ],
          )),
        ),
    );
  }
}