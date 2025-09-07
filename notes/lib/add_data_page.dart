import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/list_map_provider.dart';
import 'package:provider/provider.dart';

class AddDataPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Center(
        child: IconButton(
          onPressed: (){
            context.read<ListMapProvider>().addData({
              'name': 'Contact Name',
              'mobNo': 'Phone Number'
            });
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }

}