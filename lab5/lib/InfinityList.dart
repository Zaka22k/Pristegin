import 'package:flutter/material.dart';

class InfinityList extends StatefulWidget{
  const InfinityList({Key? key}) : super(key: key);

  @override
  createState()=> InfinityListState();
}

class InfinityListState extends State<InfinityList>{

  @override
  Widget build(BuildContext context){
    return ListView.builder(itemBuilder: (context, i){
      return Text('строка $i');
    });
  }
}

