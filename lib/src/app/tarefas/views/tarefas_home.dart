import 'package:app_sqlite_flutter/src/app/tarefas/cp_tarefas_list.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_services.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/views/tarefas_form.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TarefasHome extends StatefulWidget {
  TarefasHome({super.key});

  @override
  State<TarefasHome> createState() => _TarefasHomeState();
}

class _TarefasHomeState extends State<TarefasHome> {
  final TarefasServices services = GetIt.I();
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
                TarefasEntity? ok = await Navigator.push(context, MaterialPageRoute(builder: (context) => TarefasForm()));
                if (ok != null) {
                  inserirTarefa(ok);
                }
                definirTarefas(await buscarTarefas());
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        actions: [],
      ),
      body: Center(
        child: CpTarefasList(
          lista: tarefas, // tarefas.map((e) => TarefasEntity(id: e.id, description: e.description)).toList(),
          editar: editar,
          remover: remover,
        ),
      ),
    );
  }

  void definirTarefas(List<TarefasEntity> tarefas) {
    this.tarefas.clear();
    setState(() {
      this.tarefas.addAll(tarefas);
    });
  }

  Future<List<TarefasEntity>> buscarTarefas() async {
    return await services.getAll();
  }

  Future<int> inserirTarefa(TarefasEntity entity) async {
    return await services.inserir(entity);
  }

  void editar(TarefasEntity entity) async {
    TarefasEntity? editar = await Navigator.push(context, MaterialPageRoute(builder: (context) => TarefasForm(entity: entity)));
    print(editar?.description);
    if (editar != null) {
      services.editar(editar);
      definirTarefas(await buscarTarefas());
    }
  }

  void remover(TarefasEntity entity) async {
    await services.remover(entity);
    definirTarefas(await buscarTarefas());
  }
}
