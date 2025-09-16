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
      title: 'To do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController taskController = TextEditingController();
  List<String> tasks =[];
  List<bool> checked = [];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Center(
        child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index){
              return Card(
                  child: CheckboxListTile(
                      title: Text(tasks[index]),
                      value: checked[index],
                      onChanged: (bool? newValue){
                        setState(() {
                          checked[index] = newValue!;
                        });
                      })
              );
            })
        ,
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return Container(
                height: 400,
                width: 400,
                child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Container(
                        width: 300,
                        child: TextField(
                          controller: taskController,
                          decoration: InputDecoration(
                            hint: Text('Enter Task')
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          tasks.add(taskController.text.toString());
                          checked.add(false);
                        });
                        Navigator.pop(context);
                        taskController.clear();
                      }, child: Text("Add"))
                    ],
                  ),
              );
            });

      }),



    );
  }
}
