import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int _count = 0;

  ///events
  void incrementCount(){
    _count++;
    notifyListeners();
  }

  void decrementCount(){
    if(_count>0){
      _count--;
      notifyListeners(); 

    }
  }
}