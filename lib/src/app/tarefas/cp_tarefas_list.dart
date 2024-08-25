import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:flutter/material.dart';

class CpTarefasList extends StatelessWidget {
  CpTarefasList({super.key, required this.lista, required this.editar, required this.remover});

  final List<TarefasEntity> lista;
  final Function(TarefasEntity)? editar;
  final Function(TarefasEntity)? remover;

  _remover(TarefasEntity entity) {
    return remover == null ? null : remover!(entity);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, idx) => ListTile(
        title: Text("Desc.: ${lista[idx].description}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: editar != null ? () => editar!(lista[idx]) : null,
              icon: Icon(Icons.edit, color: Colors.amberAccent,),
            ),
            IconButton(
              onPressed: remover != null ? () => remover!(lista[idx]) : null,
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      itemCount: lista.length,
    );
  }
}
