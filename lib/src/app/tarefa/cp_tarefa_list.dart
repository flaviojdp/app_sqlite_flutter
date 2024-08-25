import 'package:app_sqlite_flutter/src/app/parse/tbl_tarefa_repository_domain.dart';
import 'package:app_sqlite_flutter/src/app/tarefa/cp_tarefa.dart';
import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_controller.dart';
import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_repository_domain.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CpTarefaList extends StatefulWidget {
  CpTarefaList({super.key, required this.tarefas});

  final TarefasEntity tarefas;

  @override
  State<CpTarefaList> createState() => _CpTarefaListState(tarefas);
}

class _CpTarefaListState extends State<CpTarefaList> {
  _CpTarefaListState(this.tarefas);

  late TarefaController controller;

  final TarefasEntity tarefas;

  final List<TarefaEntity> detalhes = [];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    this.controller = TarefaController(
      TblTarefaRepositoryDomain(GetIt.I()),
      tarefas: tarefas,
      context: context,
    );
    controller.getAllByTarefa(tarefas.id!).then((value) => definirDetalhes(value));
    return detalhes.isEmpty
        ? BtnAdd(controller: controller)
        : Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (context, idx) {
                if (idx >= detalhes.length) {
                  return BtnAdd(controller: controller);
                }
                return CpTarefa(
                  tarefa: detalhes[idx],
                  editar: (tarefa) async {
                    await controller.editar(tarefa);
                    definirDetalhes(await controller.getAllByTarefa(tarefas.id!));
                  },
                  remover: controller.remover,
                );
              },
              itemCount: this.detalhes.length + 1,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          );
  }

  definirDetalhes(List<TarefaEntity> detalhes) {
    this.detalhes.clear();
    setState(() {
      this.detalhes.addAll(detalhes);
    });
  }
}
class BtnAdd extends StatelessWidget {
  BtnAdd({super.key, required this.controller});

  final TarefaController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await this.controller.inserir();
      },
      child: Text("Novo detalhe"),
    );
  }
}
