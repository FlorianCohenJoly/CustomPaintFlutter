import 'package:custom_paint_flutter/models/happiness.dart';

Happiness myHapiness = Happiness();

class ViewModel{
  Happiness hapiness = myHapiness;

  changeValue(double newValue){
    hapiness.value = newValue;
  }
}