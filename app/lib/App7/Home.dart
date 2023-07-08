// ignore_for_file: file_names, avoid_print, unused_local_variable

import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> _listaTarefas = [];
  final TextEditingController _controleTarefas = TextEditingController();

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    print("Path: ${directory.path}");

    return File("${directory.path}/data.json");
  }

  void _saveTask() async {
    String taskStr = _controleTarefas.text;

    Map<String, dynamic> task = {
      "title": taskStr,
      "completed": false,
    };

    setState(() {
      _listaTarefas.add(task);
    });

    await _saveFile();
  }

  Future<void> _saveFile() async {
    final file = await _getFile();
    String data = jsonEncode(_listaTarefas);
    await file.writeAsString(data);
  }

  Future<String> _readFile() async {
    try {
      final file = await _getFile();
      return await file.readAsString();
    } catch (e) {
      return "ERROR";
    }
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    final item =
        "${_listaTarefas[index]["title"]}${_listaTarefas[index]["completed"].toString()}";

    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          _listaTarefas.removeAt(index);
        });
        _saveFile();
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: CheckboxListTile(
        title: Text(_listaTarefas[index]["title"]),
        value: _listaTarefas[index]["completed"],
        onChanged: (newValue) {
          setState(() {
            _listaTarefas[index]["completed"] = newValue;
          });
          _saveFile();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _readFile().then((data) {
      setState(() {
        print("Data: $data");
        _listaTarefas = jsonDecode(data) ?? [];
        print("Data2: $_listaTarefas");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Items: $_listaTarefas");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        backgroundColor: const Color.fromARGB(255, 0, 139, 121),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 255, 221),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Adicionar Tarefa"),
                content: TextField(
                  controller: _controleTarefas,
                  decoration: const InputDecoration(labelText: "Digite sua tarefa"),
                  onChanged: (text) {},
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                  TextButton(
                    onPressed: () {
                      _saveTask();
                      Navigator.pop(context);
                    },
                    child: const Text("Salvar"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: _listItemBuilder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}