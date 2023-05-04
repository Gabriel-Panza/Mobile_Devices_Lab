import 'package:flutter/material.dart';
import 'dart:math';

class JogoPedraPapelTesouraApp extends StatefulWidget {
  const JogoPedraPapelTesouraApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JogoPedraPapelTesouraAppState createState() =>
      _JogoPedraPapelTesouraAppState();
}

class _JogoPedraPapelTesouraAppState extends State<JogoPedraPapelTesouraApp> {
  final List<String> _opcoes = ['Pedra', 'Papel', 'Tesoura'];
  String? _escolhaUsuario;
  String? _escolhaOponente;
  String _resultado = "";

  void _jogar(String escolhaUsuario) {
    setState(() {
      _escolhaUsuario = escolhaUsuario;
      _escolhaOponente = _opcoes[Random().nextInt(3)];
      if (_escolhaUsuario == _escolhaOponente) {
        _resultado = 'Empate!';
      } else if (_escolhaUsuario == 'Pedra' && _escolhaOponente == 'Tesoura' ||
          _escolhaUsuario == 'Papel' && _escolhaOponente == 'Pedra' ||
          _escolhaUsuario == 'Tesoura' && _escolhaOponente == 'Papel') {
        _resultado = 'Você ganhou!';
      } else {
        _resultado = 'Você perdeu!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel e Tesoura',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pedra, Papel e Tesoura'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Escolha do oponente: $_escolhaOponente'),
              const SizedBox(height: 20),
              Text(_resultado, style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('../assets/images/pedra.png', width: 100),
                  ElevatedButton(
                    onPressed: () => _jogar('Pedra'),
                    child: const Text('Pedra'),
                  ),
                  Image.asset('../assets/images/papel.png', width: 100),
                  ElevatedButton(
                    onPressed: () => _jogar('Papel'),
                    child: const Text('Papel'),
                  ),
                  Image.asset('../assets/images/tesoura.png', width: 100),
                  ElevatedButton(
                    onPressed: () => _jogar('Tesoura'),
                    child: const Text('Tesoura'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


void main() {
  runApp(const JogoPedraPapelTesouraApp());
}
