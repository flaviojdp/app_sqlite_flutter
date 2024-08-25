import 'package:app_sqlite_flutter/src/drift/tbl_tarefas.dart';
import 'package:drift/drift.dart';

@DataClassName("Tarefa")
class TblTarefa extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text().withLength(max: 150)();
  IntColumn get tarefa => integer().references(TblTarefas, #id)();
}
