import 'package:drift/drift.dart';

@DataClassName('Tarefas')
class TblTarefas extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text().withLength(max: 150)();

}