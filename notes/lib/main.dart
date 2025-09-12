import 'package:flutter/material.dart';
import 'package:notes/counter_provider.dart';
import 'package:notes/data/local/db_helper.dart';
import 'package:notes/home_page.dart';
import 'package:notes/list_map_provider.dart';
import 'package:notes/list_page.dart';
import 'package:notes/theme_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ListMapProvider()),
      ChangeNotifierProvider(create: (context) => CounterProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider())
    ],
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: context.watch<ThemeProvider>().getThemeValue() ? ThemeMode.dark: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListPage()
    );
  }
}

class MyHomePage extends StatelessWidget {


  int _count = 0;

  @override
  Widget build(BuildContext context) {
    print("Build function called");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (ctx, _, __){
            print("Consumer build function called!!");
            return Text(
              "${Provider.of<CounterProvider>(ctx).getCount()}",
              style: TextStyle(fontSize: 25),);
          },
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(onPressed: (){
            Provider.of<CounterProvider>(context, listen: false).incrementCount(5);
          },
          child: Icon(Icons.add),),
          FloatingActionButton(onPressed: (){
            Provider.of<CounterProvider>(context, listen: false).decrementCount();
          },
            child: Icon(Icons.remove),),
        ],
      ),
    );
  }
}
