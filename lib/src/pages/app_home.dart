import 'package:app_sqlite_flutter/src/app/parse/tbl_tarefas_repository_domain.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/cp_tarefas_list.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_repository_domain.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_services.dart';
import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/repositories/tbl_tarefas_repository.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  TarefasServices services = TarefasServices(TblTarefasRepositoryDomain(TblTarefasRepository(DbDrift())));
  List<TarefasEntity> tarefas = [];

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
            onPressed: () {
              inserirTarefa("Tarefa: ${tarefas.length}").then((value) => buscarTarefas().then((t){
                setState(() {
                  tarefas = t;
                });
              }));
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: CpTarefasList(lista: tarefas.map((e) => TarefasEntity(id: e.id, description: e.description)).toList(),),
      ),
    );
  }

  Future<List<TarefasEntity>> buscarTarefas() async {
    return await services.getAll();
  }

  Future<int> inserirTarefa(String descricao) async {
    return await services.inserir(TarefasEntity(
      id: null,
      description: descricao
    ));
  }
}
