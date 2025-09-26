import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> completed = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      tasks = prefs.getStringList('tasks') ?? [];
      completed = prefs.getStringList('completed') ?? [];

      List<String> checkedStrings = prefs.getStringList('checked') ?? [];
      checked = checkedStrings.map((e) => e == 'true').toList();
    });
  }


  void _saveTasks() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('tasks', tasks);
    await prefs.setStringList('completed', completed);
    await prefs.setStringList('checked', checked.map((e) => e.toString()).toList());

  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {


    final List<Widget> _pages = [
      //Tasks Page
      Center(
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
                          if(newValue == true){
                            completed.add(tasks[index]);
                            tasks.removeAt(index);
                            checked.removeAt(index);
                          }
                          else
                            {
                              completed.remove(tasks[index]);
                            }
                          _saveTasks();

                        });
                      })
              );
            }),
      ),

      //Completed Page
      Center(
        child: ListView.builder(
            itemCount: completed.length,
            itemBuilder: (context, index){
              return Card(
                  child: CheckboxListTile(
                      title: Text(completed[index]),
                      value: true,
                      onChanged: (bool? newValue){
                        setState(() {
                          if(newValue == false){
                            tasks.add(completed[index]);
                            completed.removeAt(index);
                            _saveTasks();
                          }
                        });
                      })
              );
            }),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('To do List', style: TextStyle(fontWeight: FontWeight.bold))
      ),

      body: _pages[_selectedIndex],

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
                          _saveTasks();

                        });
                        Navigator.pop(context);
                        taskController.clear();
                      }, child: Text("Add"))
                    ],
                  ),
              );
            });

      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
            BottomNavigationBarItem(icon: Icon(Icons.check), label: "Completed")
          ]),



    );
  }
}
