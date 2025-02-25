import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Возращение значения',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: FilledButton(
          onPressed: () async {
            final result = await Navigator.pushNamed(context, "/second");

            if (result != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$result')),
              );
            }
          },
          child: const Text('Приступить к выбору...'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите любой вариант',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context, 'Да!');
              },
              child: const Text('Да!'),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                Navigator.pop(context, 'Нет.');
              },
              child: const Text('Нет.'),
            ),
          ],
        ),
      ),
    );
  }
}