import 'package:flutter/material.dart';

class Score with ChangeNotifier{
  int  _score =0;

  int  get score{
    return _score;
  }
  set score(int  score){
    _score = score;
    notifyListeners();
  }
  void increment(){
    _score += 1;
    notifyListeners();
  }
}


