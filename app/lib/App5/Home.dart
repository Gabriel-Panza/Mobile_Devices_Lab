// ignore_for_file: file_names, must_be_immutable, unused_import, unused_local_variable, avoid_print
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class Home extends StatefulWidget {
    const Home({super.key});

    @override
    State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final TextEditingController _cepController = TextEditingController();
  String street = "", district = "", state = "";

  void getCep() async{
    String url = "https://viacep.com.br/ws/" + _cepController.text + "/json/";
    http.Response response;
    response = await http.get(Uri.parse(url));

    Map<String, dynamic> ret = json.decode(response.body);
    print(response.statusCode.toString());
    print(response.body);
    street = ret["logradouro"];
    district = ret["bairro"];
    state = ret["uf"];

    setState((){

    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM Consultoria'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: _cepController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Informe o cep:"
            ),
          ),
          ElevatedButton(
            onPressed: getCep,
            child: const Text("Consultar")
          ),
          Text("Rua: " + street),
          Text("Bairro: " + district),
          Text("Estado: " + state),
        ],
      )
    );
  }
}