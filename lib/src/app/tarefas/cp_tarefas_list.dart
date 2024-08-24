import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:flutter/material.dart';

class CpTarefasList extends StatelessWidget {
  CpTarefasList({super.key, required this.lista});

  final List<TarefasEntity> lista;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, idx) => Text("Desc.: ${lista[idx].description}"),
      itemCount: lista.length,
    );
  }
}
