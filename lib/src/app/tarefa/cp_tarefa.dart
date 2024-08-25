import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CpTarefa extends StatelessWidget {
  CpTarefa({super.key, required this.tarefa, required this.editar, required this.remover});

  final TarefaEntity tarefa;
  final Function(TarefaEntity) editar;
  final Function(TarefaEntity) remover;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(flex: 4, child: Text("Desc.: ${tarefa.description}")),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => editar(this.tarefa),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.amberAccent,
                  ),
                ),
                IconButton(
                  onPressed: () => remover(this.tarefa),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
