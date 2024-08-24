import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/repositories/tbl_tarefas_repository.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  TblTarefasRepository rep = TblTarefasRepository(DbDrift());
  List<Tarefas> tarefas = [];

  @override
  void initState() {
    /*
    inserirTarefa("Teste Tarefa 1").then(
      (value) => buscarTarefas().then(
        (value) => setState(() {
          tarefas = value;
        }),
      ),
    );*/
    buscarTarefas().then(
      (value) => setState(() {
        tarefas = value;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App SQLite Flutter'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Text('App ${tarefas}'),
      ),
    );
  }

  Future<List<Tarefas>> buscarTarefas() async {
    return await rep.getAll();
  }

  Future<int> inserirTarefa(String descricao) async {
    return await rep.insert(descricao);
  }
}
