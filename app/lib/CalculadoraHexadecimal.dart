// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CalculadoraHexadecimalApp extends StatelessWidget {
  const CalculadoraHexadecimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Hexadecimal',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculadoraHexadecimalScreen(),
    );
  }
}

class CalculadoraHexadecimalScreen extends StatefulWidget {
  const CalculadoraHexadecimalScreen({super.key});

  @override
  _CalculadoraHexadecimalScreenState createState() =>
      _CalculadoraHexadecimalScreenState();
}

class _CalculadoraHexadecimalScreenState
    extends State<CalculadoraHexadecimalScreen> {
  String _expressao = '';
  String _resultado = '';

  void _adicionarDigito(String digito) {
    setState(() {
      _expressao += digito;
    });
  }

  void _calcularResultado() {
    setState(() {
      try {
        List<String> numeros = _expressao.split(RegExp(r'[-+*/]'));
        List<String> operadores = _expressao.split(RegExp(r'[0-9A-F]+')).where((element) => element.isNotEmpty).toList();

        if (numeros.length != operadores.length + 1) {
          _resultado = 'Erro';
          return;
        }

        int resultado = int.parse(numeros[0], radix: 16);

        for (int i = 0; i < operadores.length; i++) {
          int valor = int.parse(numeros[i + 1], radix: 16);

          if (operadores[i] == '+') {
            resultado += valor;
          } else if (operadores[i] == '-') {
            resultado -= valor;
          } else if (operadores[i] == '*') {
            resultado *= valor;
          } else if (operadores[i] == '/') {
            resultado ~/= valor;
          } else {
            throw Exception('Operador inválido');
          }
        }

        _expressao = '';
        _resultado = resultado.toRadixString(16).toUpperCase();
      } catch (e) {
        _resultado = 'Erro';
      }
  });
}

  void _realizarOperacao(String operador) {
    setState(() {
      try {
        int resultado;
        int valor1 = int.parse(_resultado, radix: 16);
        int valor2 = int.parse(_expressao, radix: 16);

        if (operador == '+') {
          resultado = valor1 + valor2;
        } else if (operador == '-') {
          resultado = valor1 - valor2;
        } else if (operador == '*') {
          resultado = valor1 * valor2;
        } else if (operador == '/') {
          resultado = valor1 ~/ valor2;
        } else {
          throw Exception('Operador inválido');
        }

        _expressao = resultado.toRadixString(16).toUpperCase();
        _resultado = '';
      } catch (e) {
        _resultado = 'Erro';
      }
    });
  }

  void _limpar() {
    setState(() {
      _expressao = '';
      _resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Hexadecimal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _expressao,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _resultado,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHexButton('0'),
                _buildHexButton('1'),
                _buildHexButton('2'),
                _buildHexButton('3'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHexButton('4'),
                _buildHexButton('5'),
                _buildHexButton('6'),
                _buildHexButton('7'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHexButton('8'),
                _buildHexButton('9'),
                _buildHexButton('A'),
                _buildHexButton('B'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHexButton('C'),
                _buildHexButton('D'),
                _buildHexButton('E'),
                _buildHexButton('F'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOperatorButton('+'),
                _buildOperatorButton('-'),
                _buildOperatorButton('*'),
                _buildOperatorButton('/'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _calcularResultado,
                  child: const Text('='),
                ),
                ElevatedButton(
                  onPressed: _limpar,
                  child: const Text('C'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHexButton(String digito) {
    return ElevatedButton(
      onPressed: () => _adicionarDigito(digito),
      child: Text(digito),
    );
  }

  Widget _buildOperatorButton(String operador) {
  return ElevatedButton(
    onPressed: () => _adicionarOperador(operador),
    child: Text(operador),
  );
  }

  void _adicionarOperador(String operador) {
    setState(() {
      _expressao += operador;
    });
  }
}

void main() {
  runApp(const CalculadoraHexadecimalApp());
}