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
                if(ok != null){

                  inserirTarefa(ok);
                }
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

  Future<int> inserirTarefa(TarefasEntity entity) async {
    return await services.inserir(entity);

    //return Future(() => 1);
  }
}
