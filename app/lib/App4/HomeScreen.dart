// ignore_for_file: file_names
import 'dart:math';

import 'package:flutter/material.dart';

import 'CaraCoroa.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    builder: (context) => CaraCoroa(result),
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
