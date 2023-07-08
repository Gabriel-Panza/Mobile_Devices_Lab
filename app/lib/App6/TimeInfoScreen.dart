// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TimeInfoScreen extends StatelessWidget {
  final int campeonatoId;
  final int timeId;

  const TimeInfoScreen(this.campeonatoId, this.timeId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Time'),
      ),
      body: Center(
        child: FutureBuilder<Time>(
          future: getTimeInfo(campeonatoId, timeId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar as informações do time');
            } else {
              final time = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nome: ${time?.nome}'),
                  Text('Fundação: ${time?.fundacao}'),
                  // Exiba outras informações relevantes do time
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<Time> getTimeInfo(int campeonatoId, int timeId) async {
    final url = 'https://api.api-futebol.com.br/v1/$campeonatoId/times/$timeId'; // Substitua pela URL correta da API

    // Realiza a chamada GET à API
    final response = await http.get(Uri.parse(url), headers: {
    "Authorization": "Bearer test_a8c37778328495ac24c5d0d3c3923b",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Mapeia os dados de resposta para o objeto Time
      final time = Time(
        data['id'],
        data['nome'],
        data['fundacao'],
      );

      return time;
    } 
    else {
      throw Exception('Falha ao obter as informações do time');
    }    
  }
}

class Time {
  final int id;
  final String nome;
  final String fundacao;

  Time(this.id, this.nome, this.fundacao);
}