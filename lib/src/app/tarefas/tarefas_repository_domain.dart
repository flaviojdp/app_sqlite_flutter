import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';

abstract class TarefasRepositoryDomain {
  Future<List<TarefasEntity>> getAll();
  Future<int> insert(TarefasEntity entity);
  Future<int> editar(TarefasEntity entity);
  Future<int> remover(TarefasEntity entity);
}