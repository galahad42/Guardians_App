import 'package:flutter/material.dart';

class NewEntryDataStructure {
  dynamic structure = [

  ];
}

class ValueGroup{
  late String title;
  late List<Value> values;
  ValueGroup({required this.title, required this.values});
}

class Value{
  late TextEditingController controller;
  late String title;
  Value({required this.title, String initValue = ""}){
    controller = TextEditingController()..text = initValue;
  }
}