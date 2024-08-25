import 'package:app_sqlite_flutter/src/app/parse/tbl_tarefa_repository_domain.dart';
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

  final TarefasEntity tarefas;

  final List<TarefaEntity> detalhes = [];

  //final List<String> detalhes = ["Teste aaa"];

  final TarefaRepositoryDomain rep = TblTarefaRepositoryDomain(GetIt.I());

  @override
  void initState() {
    debugPrint(tarefas.id.toString());
    rep.getAllByTarefa(tarefas.id!).then((value) {
      detalhes.clear();
      setState(() {
        detalhes.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return detalhes.isEmpty
        ? Container()
        : ListView.builder(
            itemBuilder: (context, idx) => Text(detalhes[idx].description),
            itemCount: this.detalhes.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          );
    //return Text("aaa");
  }
}
