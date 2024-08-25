import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/tbl_tarefa.dart';
import 'package:drift/drift.dart';

part 'tbl_tarefa_repository.g.dart';

@DriftAccessor(tables: [TblTarefa])
class TblTarefaRepository extends DatabaseAccessor<DbDrift> with _$TblTarefaRepositoryMixin {
  TblTarefaRepository(DbDrift dbDrift) : super(dbDrift);

  Future<List<Tarefa>> getDetalhesByTarefaId(int tarefaId) {
    return (select(tblTarefa)
      ..where((t) => t.tarefa.equals(tarefaId)))
        .get();
  }
}
