import 'package:flutter/material.dart';

class SimpleList extends StatefulWidget{
  const SimpleList({Key? key}) : super(key: key);

  @override
  createState()=> SimpleListState();
}

class SimpleListState extends State<SimpleList>{

  @override
  Widget build(BuildContext context){
    return ListView(
      children: const [
        Text('0000'),
        Divider(),
        Text('0001'),
        Divider(),
        Text('0010'),
      ],
    );
  }
}

