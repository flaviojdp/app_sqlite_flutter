import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_form.dart';
import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_repository_domain.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TarefaController {
  TarefaController(this.repository, {required this.tarefas, required this.context});

  final TarefasEntity tarefas;
  final TarefaRepositoryDomain repository;
  final BuildContext context;

  Future<int> editar(TarefaEntity entity) async {
    final TarefaEntity? result = await Navigator.push<TarefaEntity>(
        context,
        MaterialPageRoute(
            builder: (context) => TarefaForm(
              tarefas: tarefas,
              entity: entity,
            )));
    debugPrint("Editando.... ${result?.description}");
    if(result != null){
      return await repository.editar(result);
    }
    return Future(() => 1);
  }

  Future<int> inserir() async {
    final TarefaEntity? result = await Navigator.push<TarefaEntity>(
        context,
        MaterialPageRoute(
            builder: (context) => TarefaForm(
              tarefas: tarefas
            )));
    debugPrint("Cadastrando.... ${result?.description}");
    if(result != null){
      return await repository.insert(result);
    }
    return Future(() => 1);
  }

  Future<int> remover(TarefaEntity entity) async{
    debugPrint("Remover.... ${entity.description}");
    return await repository.remover(entity);
  }

  Future<List<TarefaEntity>> getAllByTarefa(int tarefa) {
    return repository.getAllByTarefa(tarefa);
  }
}
