import 'package:app_sqlite_flutter/src/app/tarefa/cp_tarefa_list.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CpTarefasList extends StatelessWidget {
  CpTarefasList({super.key, required this.lista, required this.editar, required this.remover});

  final List<TarefasEntity> lista;
  final Function(TarefasEntity)? editar;
  final Function(TarefasEntity)? remover;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, idx) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red)
        ),
        child: ListTile(
          title: Row(
            children: [
              Expanded(child: Text("Desc.: ${lista[idx].description}")),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: editar != null ? () => editar!(lista[idx]) : null,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.amberAccent,
                    ),
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
            ],
          ),
          subtitle: CpTarefaList(tarefas: lista[idx]),
        ),
      ),
      itemCount: lista.length,
    );
  }
}
