// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/detalhe_cliente.png'),
            const Text('Lista de clientes'),
            const SizedBox(height: 40), 
            Image.asset('assets/images/cliente1.png'),
            const Text("Empresa de servicos"),
            const SizedBox(height: 15), 
            Image.asset('assets/images/cliente2.png'),
            const Text("Empresa de auditoria")
          ],
        ),
      ),
    );
  }
}