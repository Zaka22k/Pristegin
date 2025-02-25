import 'package:flutter/material.dart';
import 'classes/Machine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoffeeMachine',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Кофемашина'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Machine _machine = Machine(100,100,100,100);
  String _makingResult = '';

  void _makeCoffee(coffee,milk,water,cash,type){
    _makingResult = _machine.makingCoffee(coffee, milk, water, cash, type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          spacing: 100,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              spacing: 20,
              children: [
                Text('Ресурсы машины',
                    style: Theme.of(context).textTheme.headlineMedium),
                Column(
                  spacing: 8,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Text('Кофе: ${_machine.coffeeBeans} гр.', style: Theme.of(context).textTheme.bodyLarge),
                        Text('Молоко: ${_machine.milk} мл.', style: Theme.of(context).textTheme.bodyLarge),
                        Text('Вода: ${_machine.water} мл.', style: Theme.of(context).textTheme.bodyLarge),
                        Text('Кэш: ${_machine.cash} руб.', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _machine.setResource(100);
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              spacing: 20,
              children: [
                Text('Выбор кофе', style: Theme.of(context).textTheme.headlineMedium,),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _makeCoffee(50, 0, 100, 100, "эспрессо");
                        });
                      },
                      child: Text("Эспрессо"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _makeCoffee(50, 150, 100, 300, "латте");
                        });
                      },
                      child: Text("Латте"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _makeCoffee(50, 100, 100, 300, "капучино");
                        });
                      },
                      child: Text("Капучино"),
                    ),
                  ],
                ),
                Text('$_makingResult', style: Theme.of(context).textTheme.titleLarge)
              ],
            )
          ],
        ),
      ),
    );
  }
}
