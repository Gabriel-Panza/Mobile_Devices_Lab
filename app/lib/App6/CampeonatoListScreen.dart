import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'CampeonatoInfoScreen.dart';

class CampeonatoListScreen extends StatelessWidget {
  const CampeonatoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Campeonatos'),
      ),
      body: Center(
        child: FutureBuilder<List<Campeonato>>(
          future: getCampeonatos(), // Função para obter a lista de campeonatos da API
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar os campeonatos');
            } else {
              final campeonatos = snapshot.data;
              return ListView.builder(
                itemCount: campeonatos?.length,
                itemBuilder: (context, index) {
                  final campeonato = campeonatos![index];
                  return ListTile(
                    title: Text(campeonato.nome),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CampeonatoInfoScreen(campeonato.id),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Campeonato>> getCampeonatos() async {
    const url = 'https://api.api-futebol.com.br/v1/'; // Substitua pela URL correta da API de futebol

    // Realiza a chamada GET à API
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Mapeia os dados de resposta para a lista de campeonatos
      final campeonatos = List<Campeonato>.from(data['campeonatos'].map((campeonato) {
        return Campeonato(
          campeonato['id'],
          campeonato['nome'],
        );
      }));

      return campeonatos;
    }
    else {
      throw Exception('Falha ao obter os campeonatos');
    }
  }
}

class Campeonato {
  final int id;
  final String nome;

  Campeonato(this.id, this.nome);
}
