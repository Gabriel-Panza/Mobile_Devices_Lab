// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/detalhe_contato.png'),
            const Text('Informações de contato'),
            const SizedBox(height: 40), 
            const Text(
              'Email: atendimento@gmail.com'
            ),
            const SizedBox(height: 10), 
            const Text(
              'Telefone: 6666-6666'
            ),
            const SizedBox(height: 10), 
            const Text(
              'Celular: (21) 99999-9999'
            )
          ],
        ),
      ),
    );
  }
}