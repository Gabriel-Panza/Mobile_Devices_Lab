import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recoverDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, "banco.db");

    print("Path DB: ${path}");

    Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          String sql = """
          CREATE TABLE TAREFAS(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          texto_tarefa VARCHAR,
          concluido INTEGER
        );
        """;
          await db.execute(sql);
        }
    );
    return db;
  }

  List _listaTarefas = [];
  

  TextEditingController _controllerTarefa = TextEditingController();

  _saveTarefa(bool concluido) async{
    Database db = await _recoverDatabase();
    int valor;

    Map<String, dynamic> tarefa = {
      "texto_tarefa": _controllerTarefa.text,
      "concluido" : concluido ? 1 : 0
    };

    int tarefaId = await db.insert("TAREFAS", tarefa);
    _readTarefas();
  }

  _readTarefas() async{
    Database db = await _recoverDatabase();
    List query = await db.rawQuery("select * from TAREFAS");
    _listaTarefas = query.toList();
    setState(() {

    });
  }

  _editTarefa(int tarefaIndex, bool? value) async{
    Database db = await _recoverDatabase();
    int boolAsInt = _listaTarefas[tarefaIndex]["concluido"];

    if (value != null) boolAsInt = value ? 1 : 0;

    Map<String, dynamic> tarefa = {
      "texto_tarefa": _controllerTarefa.text ?? _listaTarefas[tarefaIndex]["texto_tarefa"],
      "concluido" : boolAsInt
    };
    await db.update("TAREFAS", tarefa, where: 'id = ?', whereArgs: [_listaTarefas[tarefaIndex]["id"]]);
    _readTarefas();
  }

  _removeTarefa(int tarefaIndex) async{
    Database db = await _recoverDatabase();
    await db.delete("TAREFAS", where: "id = ?", whereArgs: [_listaTarefas[tarefaIndex]["id"]]);
  }

  @override
  void initState() {
    super.initState();
    _readTarefas();

    setState(() {

    });

  }

  Future<dynamic> _showCreateEditDialog(BuildContext context, {bool editing = false, int? editingIndex} ) {
    if (editing) {
      _controllerTarefa.text = _listaTarefas[editingIndex!]["texto_tarefa"];
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Editar Tarefa"),
              content: TextField(
                  controller: _controllerTarefa,
                  decoration:
                  InputDecoration(labelText: "Digite sua tarefa"),
                  onChanged: (text) {}),
              actions: [
                TextButton(
                    onPressed: () {
                      _controllerTarefa.text = "";
                      _readTarefas();
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                TextButton(
                    onPressed: () async {
                      await _editTarefa(editingIndex!, null);
                      _controllerTarefa.text = "";
                      _readTarefas();
                      Navigator.pop(context);
                    },
                    child: Text("Salvar")),
              ],
            );
          });
    } else {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Adicionar Tarefa"),
              content: TextField(
                  controller: _controllerTarefa,
                  decoration:
                  InputDecoration(labelText: "Digite sua tarefa"),
                  onChanged: (text) {}),
              actions: [
                TextButton(
                    onPressed: () {
                      _controllerTarefa.text = "";
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                TextButton(
                    onPressed: () async {
                      await _saveTarefa(false);
                      _controllerTarefa.text = "";
                      Navigator.pop(context);
                    },
                    child: Text("Salvar")),
              ],
            );
          });
    }
  }

  Widget listItemCreate(BuildContext context, int index) {
    return Dismissible(
        key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            _removeTarefa(index);
          } else {
            _showCreateEditDialog(context, editing: true, editingIndex: index);
          }
        },
        background: Container(
          color: Colors.amber,
          padding: EdgeInsets.all(16),
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                )
              ]
          ),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.white,
                )
              ]
          ),
        ),
        child: CheckboxListTile(
          title: Text(_listaTarefas[index]["texto_tarefa"]),
          value: _listaTarefas[index]["concluido"] == 1 ? true : false,
          onChanged: (newVal) {
            setState(() {

            });
          },
        )
    );


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: () {
          _showCreateEditDialog(context, editing: false);
        },
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: listItemCreate
            )
          )
        ]),
      ),
    );
  }
}
