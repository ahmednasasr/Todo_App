import 'package:flutter/material.dart';

class mainprovider extends ChangeNotifier{
  int selectindex=0;
  DateTime selectedatepicker=DateTime.now();
  ThemeMode themeMode = ThemeMode.light;
  void selectedindex(int index){
     selectindex =index;
    notifyListeners();
  }
  void setdatepicker(DateTime datetime){
    selectedatepicker=datetime;
    notifyListeners();
  }
  void changetheme(ThemeMode thememode){
    themeMode= thememode;
    notifyListeners();
  }
}

