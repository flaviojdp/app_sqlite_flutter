import 'dart:io';

import 'package:app_sqlite_flutter/src/drift/tbl_tarefa.dart';
import 'package:app_sqlite_flutter/src/drift/tbl_tarefas.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db_drift.g.dart';

LazyDatabase _openConnection() {
  print("_openConnection");
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db_app_sqlite.sqlite'));
    print(file.path);
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [TblTarefas, TblTarefa], daos: [])
final class DbDrift extends _$DbDrift {
  DbDrift([QueryExecutor? implementation]) : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
