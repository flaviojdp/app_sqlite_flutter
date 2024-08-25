import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';

class TarefaEntity {
  int? _id;
  String _description;

  TarefasEntity _tarefas;

  TarefaEntity({required int? id, required String description, required int tarefa})
      : _id = id,
        _description = description,
        _tarefas = TarefasEntity(id: tarefa, description: "");

  factory TarefaEntity.vazio({required int tarefa}) {
    return TarefaEntity(id: null, description: "", tarefa: tarefa);
  }

  int? get id => _id;

  String get description => _description;

  set setDescription(String description) {
    _description = description;
  }

  @override
  String toString() {
    return 'TarefasEntity{id: $_id, description: $_description, tarefa: ${_tarefas.id ?? ""}';
  }
}
