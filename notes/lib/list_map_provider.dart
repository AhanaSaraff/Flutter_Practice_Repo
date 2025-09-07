import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier{

  List<Map<String, dynamic>> _mData = [];

  ///events
  void addData(Map<String, dynamic> data){
    _mData.add(data);
    notifyListeners();
  }

  void updateData(Map<String, dynamic> updateData, int index){
    _mData[index] = updateData;
    notifyListeners();
  }

  void deleteDate(int index){
    _mData.removeAt(index);
    notifyListeners();


  }

  List<Map<String, dynamic>> getData(){
    return _mData;
  }

}