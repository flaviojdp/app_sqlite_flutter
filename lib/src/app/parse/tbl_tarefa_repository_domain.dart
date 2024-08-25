import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_repository_domain.dart';
import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/repositories/tbl_tarefa_repository.dart';

class TblTarefaRepositoryDomain implements TarefaRepositoryDomain {
  TblTarefaRepositoryDomain(this.repository);

  final TblTarefaRepository repository;

  @override
  Future<int> editar(TarefaEntity entity) {
    return repository.editar(entity);
  }

  @override
  Future<List<TarefaEntity>> getAll() async {
    return toListTarefaEntity(await repository.getAll());
  }

  @override
  Future<List<TarefaEntity>> getAllByTarefa(int tarefas) {
    return repository.getDetalhesByTarefaId(tarefas).then((v) => toListTarefaEntity(v));
  }

  List<TarefaEntity> toListTarefaEntity(List<Tarefa> listTarefa) {
    return listTarefa.map((e) => TarefaEntity(id: e.id, description: e.description, tarefa: e.tarefa)).toList();
  }

  @override
  Future<int> insert(TarefaEntity entity) {
    return repository.insert(entity);
  }

  @override
  Future<int> remover(TarefaEntity entity) {
    return repository.remover(entity);
  }
}
