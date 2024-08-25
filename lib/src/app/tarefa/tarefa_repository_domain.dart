import 'package:app_sqlite_flutter/src/app/geral/repository_domain.dart';
import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_entity.dart';

abstract class TarefaRepositoryDomain extends RepositoryDomain<TarefaEntity> {
  Future<List<TarefaEntity>> getAllByTarefa(int tarefas);
}
