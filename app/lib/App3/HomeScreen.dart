// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'ClientScreen.dart';
import 'CompanyScreen.dart';
import 'ContactScreen.dart';
import 'ServiceScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM Consultoria'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CompanyScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Image.asset('assets/images/menu_empresa.png', fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ServiceScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Image.asset('assets/images/menu_servico.png', fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ClientScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Image.asset('assets/images/menu_cliente.png', fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ContactScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Image.asset('assets/images/menu_contato.png', fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}