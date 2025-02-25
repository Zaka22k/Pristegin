import 'package:flutter/material.dart';
import 'dart:math';

class InfinityMathList extends StatefulWidget{
  const InfinityMathList({Key? key}) : super(key: key);

  @override
  createState()=> InfinityMathListState();
}

class InfinityMathListState extends State<InfinityMathList>{

  @override
  Widget build(BuildContext context){
    return ListView.builder(itemBuilder: (context, i) {
      if(i.isOdd) return Divider();

      final int index = i ~/ 2;

      return ListTile(title: Text("2 ^ $index = ${pow(2, index)}"));
    });
  }
}

