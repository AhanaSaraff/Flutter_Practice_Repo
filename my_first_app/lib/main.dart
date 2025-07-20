import 'package:flutter/material.dart';

void main(){
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var names = ['Ahana', 'Asifahmed', 'Hamza', 'Tabassum'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Text("Hello World!"),
          Text("Hello World!"),
        ],
      )
    );
  }

}

// ListView.separated(itemBuilder: (context, index){
// return ListTile(
// title: Text(names[index]),
// trailing: Icon(Icons.add),
// );
// },
// itemCount: names.length,
// separatorBuilder: (context, index){
// return Divider(
// thickness: 2,
// );
// },)


// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 8, top: 10),
// child: Expanded(
// flex: 2,
// child: Container(
// margin: EdgeInsets.all(11),
// height: 100,
// width: 50,
// color: Colors.orange,
// ),
// ),
// ),
// Expanded(
// flex: 4,
// child: Container(
// height: 100,
// width: 50,
// color: Colors.blue,
// ),
// ),
// Expanded(
// flex: 2,
// child: Container(
// height: 100,
// width: 50,
// color: Colors.green,
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Expanded(
// flex:1,
// child: Container(
// width: 50,
// height: 100,
// color: Colors.blueGrey,
// ),
// ),
// )
// ],
// )

// Container(
// width: double.infinity,
// height: double.infinity,
// color: Colors.blue.shade50,
// child: Center(
// child: Container(
// width: 200,
// height: 200,
// decoration: BoxDecoration(
// color: Colors.blue,
// borderRadius: BorderRadius.circular(10),
// border: Border.all(
// width: 3,
// color: Colors.black
// ),
// boxShadow: [BoxShadow(
// color: Colors.pink,
// spreadRadius: 50,
// blurRadius: 100
// )]
// ),
// ),
// ),
// ),