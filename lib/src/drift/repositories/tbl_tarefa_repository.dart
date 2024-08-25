import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_entity.dart';
import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/tbl_tarefa.dart';
import 'package:drift/drift.dart';

part 'tbl_tarefa_repository.g.dart';

@DriftAccessor(tables: [TblTarefa])
class TblTarefaRepository extends DatabaseAccessor<DbDrift> with _$TblTarefaRepositoryMixin {
  TblTarefaRepository(DbDrift dbDrift) : super(dbDrift);

  Future<List<Tarefa>> getDetalhesByTarefaId(int tarefaId) {
    return (select(tblTarefa)..where((t) => t.tarefa.equals(tarefaId))).get();
  }

  Future<List<Tarefa>> getAll() {
    return select(tblTarefa).get();
  }

  Future<int> insert(TarefaEntity entity) {
    return into(tblTarefa).insert(
      TblTarefaCompanion(
        description: Value(entity.description),
        tarefa: Value(entity.tarefas.id!)
      ),
    );
  }

  Future<int> editar(TarefaEntity entity) {
    return (update(tblTarefa)..where((tbl) => tbl.id.equals(entity.id!))).write(TblTarefaCompanion(description: Value(entity.description)));
  }

  Future<int> remover(TarefaEntity entity) {
    return (this.delete(tblTarefa)..where((tbl) => tbl.id.equals(entity.id!))).go();
  }
}
