import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/tbl_tarefas.dart';
import 'package:drift/drift.dart';

part 'tbl_tarefas_repository.g.dart';

@DriftAccessor(tables: [TblTarefas])
class TblTarefasRepository extends DatabaseAccessor<DbDrift> with _$TblTarefasRepositoryMixin {
  TblTarefasRepository(DbDrift dbDrift) : super(dbDrift);

  Future<List<Tarefas>> getAll() {
    return select(tblTarefas).get();
  }

  Future<int> insert(TarefasEntity entity) {
    return into(tblTarefas).insert(TblTarefasCompanion(
      description: Value(entity.description)
    ));
  }

  Future<int> editar(TarefasEntity entity) {
    return (update(tblTarefas)..where((tbl) => tbl.id.equals(entity.id!))).write(TblTarefasCompanion(description: Value(entity.description)));
  }
}
