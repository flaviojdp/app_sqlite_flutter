import 'package:app_sqlite_flutter/src/app/parse/tbl_tarefas_repository_domain.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/cp_tarefas_list.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_services.dart';
import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/repositories/tbl_tarefas_repository.dart';
import 'package:flutter/material.dart';

class TarefasHome extends StatefulWidget {
  TarefasHome({super.key});

  @override
  State<TarefasHome> createState() => _TarefasHomeState();
}

class _TarefasHomeState extends State<TarefasHome> {
  final TarefasServices services = TarefasServices(TblTarefasRepositoryDomain(TblTarefasRepository(DbDrift())));
  final List<TarefasEntity> tarefas = [];

  @override
  void initState() {
    buscarTarefas().then(
      (value) => setState(() {
        tarefas.clear();
        tarefas.addAll(value);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          children: [
            Text(
              "Tarefas",
              style: TextStyle(
                fontSize: 60,
              ),
            ),
            IconButton(
              onPressed: () async {
                await inserirTarefa("Tarefas: ${tarefas.length}");
                buscarTarefas().then((t) {
                  setState(() {
                    tarefas.clear();
                    tarefas.addAll(t);
                  });
                });
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        actions: [],
      ),
      body: Center(
        child: CpTarefasList(
          lista: tarefas.map((e) => TarefasEntity(id: e.id, description: e.description)).toList(),
        ),
      ),
    );
  }

  Future<List<TarefasEntity>> buscarTarefas() async {
    return await services.getAll();
  }

  Future<int> inserirTarefa(String descricao) async {
    return await services.inserir(TarefasEntity(id: null, description: descricao));
  }
}
