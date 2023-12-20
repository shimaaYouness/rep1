import 'package:flutter/cupertino.dart';

class YearProvider extends ChangeNotifier{

  int? year = DateTime.now().year;

  void nextYear() {
    year! < DateTime.now().year ? year = year! + 1 : {};
  notifyListeners();
  }

  void prevYear() {
    year = year! - 1;
    notifyListeners();
  }
}