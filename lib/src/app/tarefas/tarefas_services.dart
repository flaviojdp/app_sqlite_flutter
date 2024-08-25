import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefas/tarefas_repository_domain.dart';

class TarefasServices {
  TarefasServices(this.repositoryDomain);

  final TarefasRepositoryDomain repositoryDomain;

  Future<List<TarefasEntity>> getAll() {
    return repositoryDomain.getAll();
  }

  Future<int> inserir(TarefasEntity entity) {
    return repositoryDomain.insert(entity);
  }

  Future<int> editar(TarefasEntity entity) {
    return repositoryDomain.editar(entity);
  }

  Future<int> remover(TarefasEntity entity) {
    return repositoryDomain.remover(entity);
  }
}
