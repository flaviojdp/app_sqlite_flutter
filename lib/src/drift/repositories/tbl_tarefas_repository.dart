import 'package:app_sqlite_flutter/src/drift/db_drift.dart';
import 'package:app_sqlite_flutter/src/drift/tbl_tarefas.dart';
import 'package:drift/drift.dart';

part 'tbl_tarefas_repository.g.dart';

@DriftAccessor(tables: [TblTarefas])
class TblTarefasRepository extends DatabaseAccessor<DbDrift> with _$TblTarefasRepositoryMixin {
  TblTarefasRepository(DbDrift dbDrift) : super(dbDrift);

  Future<List<Tarefas>> getAll(){
    return select(tblTarefas).get();
  }

  Future<int> insert(TblTarefasCompanion tbl){
    return into(tblTarefas).insert(tbl);
  }
}
