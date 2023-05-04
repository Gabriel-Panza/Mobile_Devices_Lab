import 'package:flutter/material.dart';
import 'dart:math';

class Frase {
  String texto;

  Frase({required this.texto});
}

class EstruturaDeDados {
  List<Frase> frases = [
    Frase(texto: "Tenha um Ótimo dia!"),
    Frase(texto: "Tenha uma Ótima tarde!"),
    Frase(texto: "Tenha uma Ótima noite!"),
    Frase(texto: "Tenha um Ótimo dia!"),
    Frase(texto: "Tenha uma Ótima semana!"),
    Frase(texto: "Tenha um Ótimo semestre!"),
  ];

  Frase getFraseAleatoria() {
    final random = Random();
    final index = random.nextInt(frases.length);
    return frases[index];
  }
}

class FraseAleatoriaApp extends StatefulWidget {
  const FraseAleatoriaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FraseAleatoriaAppState createState() => _FraseAleatoriaAppState();
}

class _FraseAleatoriaAppState extends State<FraseAleatoriaApp> {
  final estruturaDeDados = EstruturaDeDados();
  late Frase fraseAtual;

  void _gerarFraseAleatoria() {
    setState(() {
      fraseAtual = estruturaDeDados.getFraseAleatoria();
    });
  }

  @override
  void initState() {
    super.initState();
    _gerarFraseAleatoria();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frase Aleatória',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Frases Aleatórias'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('../assets/images/title.png'),
              const SizedBox(height: 20),
              Text(fraseAtual.texto),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _gerarFraseAleatoria,
                child: const Text('Gerar nova frase'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const FraseAleatoriaApp());
}