import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:flutter/material.dart';

class CpTarefasList extends StatelessWidget {
  CpTarefasList({super.key, required this.lista, required this.editar});

  final List<TarefasEntity> lista;
  final Function(TarefasEntity)? editar;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, idx) => ListTile(
        title: Text("Desc.: ${lista[idx].description}"),
        trailing: IconButton(
          onPressed: editar != null ? () => editar!(lista[idx]) : null,
          icon: Icon(Icons.edit),
        ),
      ),
      itemCount: lista.length,
    );
  }
}
