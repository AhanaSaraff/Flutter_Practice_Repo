import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/add_data_page.dart';
import 'package:notes/list_map_provider.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List')
      ),
      body: Consumer<ListMapProvider>(
        builder: (ctx, provider,__){
          var allData = provider.getData();
          return allData.isNotEmpty ? ListView.builder(
              itemCount: allData.length,
              itemBuilder: (_, index){
            return ListTile(
              title: Text('${allData[index]['name']}'),
              subtitle: Text('${allData[index]['mobNo']}'),
              trailing: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      context.read<ListMapProvider>().updateData({
                        "name": "Updated Contact",
                        "mobNo" : "7711771171"
                      }, index);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){
                      context.read<ListMapProvider>().deleteDate(index);
                    }, icon: Icon(Icons.delete, color: Colors.red)),
                  ],
                ),
              ),
            );
          }) : Center(child: Text('No Contacts yet!!'));
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddDataPage()));
      },
      child: Icon(Icons.add)),
    );
  }

}