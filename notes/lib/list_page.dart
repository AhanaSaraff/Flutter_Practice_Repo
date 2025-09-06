import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        builder: (_, provider,__){
          return provider.getData().isNotEmpty ? ListView.builder(itemBuilder: (_, index){

          }) : Center();
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            context.read<ListMapProvider>().addData({
              'name': 'Contact Name',
              'mobNo': 'Phone Number'
            });
      }),
    );
  }

}