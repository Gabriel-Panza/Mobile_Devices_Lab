// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviço'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/detalhe_servico.png'),
            const Text('Lista de serviços oferecidos'),
            const SizedBox(height: 40), 
            const Text(
              'Servico 1: Conserto'
            ),
            const SizedBox(height: 5), 
            const Text(
              'Servico 2: Limpeza'
            ),
            const SizedBox(height: 5), 
            const Text(
              'Servico 3: Negociações'
            )
          ],
        ),
      ),
    );
  }
}