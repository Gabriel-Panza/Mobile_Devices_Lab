// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/detalhe_empresa.png'),
            const Text('Descrição da empresa'),
            const SizedBox(height: 40), 
            const Text(
              'Somos uma empresa de consultoria TOP de linha!'
              ),

          ],
        ),
      ),
    );
  }
}

