
import 'dart:math';


import 'package:flutter/material.dart';

class AnimalController extends ChangeNotifier{

  List allData = ['bear','camel','deer','dog','elephant','fish','horse','lion','monkey','pigeon'];

  int  index = 0;

  Random r = Random();

  Color myColor = Colors.grey;




myRandom(){

  index = r.nextInt(allData.length);
  notifyListeners();


}




}