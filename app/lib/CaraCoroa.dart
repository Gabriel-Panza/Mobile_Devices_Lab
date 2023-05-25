// ignore_for_file: file_names
import 'dart:math';

import 'package:flutter/material.dart';

class CaraOuCoroaApp extends StatelessWidget {
  const CaraOuCoroaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cara ou Coroa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cara ou Coroa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_cc.png'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String result = Random().nextBool() ? 'cara' : 'coroa';
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(result),
                  ),
                );
              },
              child: const Text('Jogar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String result;

  const ResultPage(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/$result.png';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 30),
            Text(
              result.toUpperCase(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const CaraOuCoroaApp());