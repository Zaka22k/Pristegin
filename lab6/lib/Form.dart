import 'package:flutter/material.dart';

class MyForm extends StatefulWidget{
  const MyForm({Key? key}):super(key:key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State{
  final _formKey = GlobalKey<FormState>();
  String _resultSquare = "задайте параметры";
  double _width = 0;
  double _height = 0;

  void _calculateSquare(){
    _formKey.currentState!.save();
    setState(() {
      _resultSquare = "S = $_width * $_height = ${_width*_height} (мм2)";
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              spacing: 20,
              children: [
                Text("Ширина (мм):"),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(),
                    validator: (value) {
                      if(value!.isEmpty || num.tryParse(value) == null) return "Задайте Ширину";
                    },
                    onSaved: (value){
                      _width = double.parse(value!);
                    },
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 40,
            ),

            Row(
              spacing: 20,
              children: [
                const Text("Высота (мм):"),
                Expanded(
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty || num.tryParse(value) == null) return "Задайте Высоту";
                    },
                    onSaved: (value){
                      _height = double.parse(value!);
                    },
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            FilledButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  _calculateSquare();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Успешное вычисление"),backgroundColor: Colors.green,)
                  );
                }
              },
              child: const Text("Вычислить"),
            ),

            const SizedBox(
              height: 20,
            ),

            Text("$_resultSquare", style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }

}