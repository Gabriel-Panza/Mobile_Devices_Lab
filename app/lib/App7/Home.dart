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
  List<Map<String, dynamic>> _taskList = [];
  TextEditingController _taskController = TextEditingController();

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    print("Path: ${directory.path}");

    return File("${directory.path}/data.json");
  }

  void _saveTask() async {
    String taskStr = _taskController.text;

    Map<String, dynamic> task = {
      "title": taskStr,
      "completed": false,
    };

    setState(() {
      _taskList.add(task);
    });

    await _saveFile();
  }

  Future<void> _saveFile() async {
    final file = await _getFile();
    String data = jsonEncode(_taskList);
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
        "${_taskList[index]["title"]}${_taskList[index]["completed"].toString()}";

    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          _taskList.removeAt(index);
        });
        _saveFile();
      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: CheckboxListTile(
        title: Text(_taskList[index]["title"]),
        value: _taskList[index]["completed"],
        onChanged: (newValue) {
          setState(() {
            _taskList[index]["completed"] = newValue;
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
        _taskList = jsonDecode(data) ?? [];
        print("Data2: $_taskList");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Items: $_taskList");

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Color.fromARGB(255, 0, 139, 121),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 0, 255, 221),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Adicionar Tarefa"),
                content: TextField(
                  controller: _taskController,
                  decoration: InputDecoration(labelText: "Digite sua tarefa"),
                  onChanged: (text) {},
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar"),
                  ),
                  TextButton(
                    onPressed: () {
                      _saveTask();
                      Navigator.pop(context);
                    },
                    child: Text("Salvar"),
                  ),
                ],
              );
            },
          );
        },
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _taskList.length,
                itemBuilder: _listItemBuilder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}