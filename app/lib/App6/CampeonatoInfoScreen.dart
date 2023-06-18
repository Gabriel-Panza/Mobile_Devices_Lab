import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CampeonatoInfoScreen extends StatelessWidget {
  final int campeonatoId;

  const CampeonatoInfoScreen(this.campeonatoId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Campeonato'),
      ),
      body: Center(
        child: FutureBuilder<Campeonato>(
          future: getCampeonatoInfo(campeonatoId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar as informações do campeonato');
            } else {
              final campeonato = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nome: ${campeonato?.nome}'),
                  Text('Local: ${campeonato?.local}'),
                  // Exiba outras informações relevantes do campeonato
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<Campeonato> getCampeonatoInfo(int campeonatoId) async {
    final url = 'https://api.api-futebol.com.br/v1/$campeonatoId'; // Substitua pela URL correta da API

    // Realiza a chamada GET à API
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Mapeia os dados de resposta para o objeto Campeonato
      final campeonato = Campeonato(
        data['id'],
        data['nome'],
        data['local'],
      );

      return campeonato;
    } 
    else {
      throw Exception('Falha ao obter as informações do campeonato');
    }
  }
}

class Campeonato {
  final int id;
  final String nome;
  final String local;

  Campeonato(this.id, this.nome, this.local);
}
