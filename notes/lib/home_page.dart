import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/data/local/db_helper.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List<Map<String, dynamic>> allNotes = [];
  DBHelper? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = DBHelper.getInstance;
    getNotes();
  }

  void getNotes() async{
    allNotes = await dbRef!.getAllNotes();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Notes App"),
      ),

      body: allNotes.isNotEmpty ? ListView.builder(
          itemCount: allNotes.length,
          itemBuilder: (_, index){
            return ListTile(
              leading: Text('${allNotes[index][DBHelper.COLUMN_NOTE_SNO]}'),
              title: Text(allNotes[index][DBHelper.COLUMN_NOTE_TITLE]),
              subtitle: Text(allNotes[index][DBHelper.COLUMN_NOTE_DESC]),
            );
          }) : Center(
        child: Text('No Notes Yet!!'),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () async{
            showModalBottomSheet(context: context, builder: (context){
              return Container(
                padding: EdgeInsets.all(11),
                width: double.infinity,
                child: Column(
                  children: [
                    Text('Add Note', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 21,
                    ),

                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Enter title here",
                        label: Text('Title'),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    SizedBox(height: 11,),
                    TextField(
                      controller: descController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Enter description here",
                        label: Text('Description'),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    SizedBox(height: 11,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(onPressed: ()async{
                          var Title = titleController.text;
                          var Desc = descController.text;
                          if(Title.isNotEmpty && Desc.isNotEmpty){
                            bool check = await dbRef!.addNote(mTitle: Title, mDesc: Desc);
                            if(check){
                              getNotes();
                            }
                            Navigator.pop(context);
                          }else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
                            }
                        }, child: Text("Add Note")),
                        SizedBox(width: 10,),
                        OutlinedButton(onPressed: (){

                        }, child: Text("Cancel")),
                      ],
                    )
                  ]
                )
              );
            });
          },
          child: Icon(Icons.add),
      ),

    );
  }
}

