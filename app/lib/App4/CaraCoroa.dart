// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CaraCoroa extends StatelessWidget {
  final String result;

  const CaraCoroa(this.result, {super.key});

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