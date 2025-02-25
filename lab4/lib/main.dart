import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab4',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade800),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Общежития КубГАУ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _heartCounter = 0;

  void _incrementCounter() {
    setState(() {
      _heartCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Image.asset("assets/kubsau.jpg"),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              spacing: 20,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Text('Общежитие №20', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('Краснодар, ул. Калинина, 13', style: TextStyle(fontSize: 16, color: Colors.grey.shade500))
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: _incrementCounter, icon: Icon(Icons.favorite, color: Colors.red,)),
                        Text("$_heartCounter", style: TextStyle(fontSize: 16),)
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                      print("Якобы звоним");
                    },
                        child:
                        Column(
                            spacing: 4,
                            children: [
                              Icon(Icons.phone, color: Colors.green, size: 25,),
                              Text("ПОЗВОНИТЬ", style: TextStyle(color: Colors.green)),
                            ],
                        )
                    ),
                    TextButton(
                        onPressed: () {
                          print("Якобы строим маршрут");
                        },
                        child:
                        Column(
                          spacing: 4,
                          children: [
                            Icon(Icons.map, color: Colors.green, size: 25,),
                            Text("МАРШРУТ", style: TextStyle(color: Colors.green)),
                          ],
                        )
                    ),
                    TextButton(
                        onPressed: () {
                          print("Якобы делимся");
                        },
                        child:
                        Column(
                          spacing: 4,
                          children: [
                            Icon(Icons.share, color: Colors.green, size: 25,),
                            Text("ПОДЕЛИТЬСЯ", style: TextStyle(color: Colors.green)),
                          ],
                        )
                    )
                  ],
                ),
                Text('Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитияхуниверситета, при поселении между администрацией и студентами заключаетсядоговор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствияасоциальных явлений в молодежной среде. Условия проживания в общежитияхуниверситетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов инаглядной агитации. С целью улучшения условий быта студентов активно работаетсистема студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
