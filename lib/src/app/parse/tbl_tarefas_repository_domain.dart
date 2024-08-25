import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_repository_domain.dart';
import 'package:app_sqlite_flutter/src/drift/repositories/tbl_tarefas_repository.dart';

class TblTarefasRepositoryDomain implements TarefasRepositoryDomain{

  TblTarefasRepositoryDomain(this.repository);
  final TblTarefasRepository repository;

  @override
  Future<List<TarefasEntity>> getAll() {
    return repository.getAll().then((v) => v.map((e) => TarefasEntity(id: e.id, description: e.description)).toList());
  }

  @override
  Future<int> insert(TarefasEntity entity) {
    return repository.insert(entity);
  }

  @override
  Future<int> editar(TarefasEntity entity) {
    return repository.editar(entity);
  }

  @override
  Future<int> remover(TarefasEntity entity) {
    return repository.remover(entity);
  }

}