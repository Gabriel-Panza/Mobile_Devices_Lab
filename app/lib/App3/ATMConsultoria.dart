// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ATMConsultoriaApp extends StatelessWidget {
  const ATMConsultoriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATM Consultoria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM Consultoria'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Image.asset('assets/images/menu_empresa.png');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CompanyScreen()),
                );
              },
              child: const Text('Empresa'),
            ),
            ElevatedButton(
              onPressed: () {
                Image.asset('assets/images/menu_servico.png');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServiceScreen()),
                );
              },
              child: const Text('Serviço'),
            ),
            ElevatedButton(
              onPressed: () {
                Image.asset('assets/images/menu_cliente.png');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClientScreen()),
                );
              },
              child: const Text('Cliente'),
            ),
            ElevatedButton(
              onPressed: () {
                Image.asset('assets/images/menu_contatoS.png');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactScreen()),
                );
              },
              child: const Text('Contato'),
            ),
          ],
        ),
      ),
    );
  }
}

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
            const SizedBox(height: 20), 
            const Text(
              'Somos uma empresa de consultoria TOP de linha!'
              ),

          ],
        ),
      ),
    );
  }
}

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
            const SizedBox(height: 20), 
            const Text(
              'Servico 1'
            ),
            const SizedBox(height: 5), 
            const Text(
              'Servico 2'
            ),
            const SizedBox(height: 5), 
            const Text(
              'Servico 3'
            )
          ],
        ),
      ),
    );
  }
}

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
            const SizedBox(height: 20), 
            Image.asset('assets/images/cliente1.png'),
            const Text("Empresa de servicos"),
            const SizedBox(height: 20), 
            Image.asset('assets/images/cliente2.png'),
            const Text("Empresa de auditoria")
          ],
        ),
      ),
    );
  }
}

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
            const SizedBox(height: 20), 
            const Text(
              'Email: atendimento@gmail.com'
            ),
            const SizedBox(height: 5), 
            const Text(
              'Telefone: (21) 6666-6666'
            ),
            const SizedBox(height: 5), 
            const Text(
              'Celular: (+55)(21) 99999-9999'
            )
          ],
        ),
      ),
    );
  }
}