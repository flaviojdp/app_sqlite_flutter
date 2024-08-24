import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_repository_domain.dart';
import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/repositories/tbl_tarefas_repository.dart';
import 'package:drift/drift.dart';

class TblTarefasRepositoryDomain implements TarefasRepositoryDomain{

  TblTarefasRepositoryDomain(this.repository);
  final TblTarefasRepository repository;

  @override
  Future<List<TarefasEntity>> getAll() {
    return repository.getAll().then((v) => v.map((e) => TarefasEntity(id: e.id, description: e.description)).toList());
  }

  @override
  Future<int> insert(TarefasEntity entity) {
    return repository.insert(TblTarefasCompanion(
      description: Value(entity.description)
    ));
  }

}