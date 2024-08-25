import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_entity.dart';
import 'package:app_sqlite_flutter/src/app/tarefa/tarefa_repository_domain.dart';
import 'package:app_sqlite_flutter/src/drift/repositories/tbl_tarefa_repository.dart';

class TblTarefaRepositoryDomain implements TarefaRepositoryDomain {
  TblTarefaRepositoryDomain(this.repository);

  final TblTarefaRepository repository;

  @override
  Future<List<TarefaEntity>> getAllByTarefas(int tarefas) {
    return repository.getDetalhesByTarefaId(tarefas).then((v) => v.map((e) => TarefaEntity(id: e.id, description: e.description, tarefa: e.tarefa)).toList());
  }

  @override
  Future<int> editar(TarefaEntity entity) {
    // TODO: implement editar
    throw UnimplementedError();
  }

  @override
  Future<List<TarefaEntity>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<List<TarefaEntity>> getAllByTarefa(int tarefas) {
    return repository.getDetalhesByTarefaId(tarefas).then(
          (v) => v
              .map(
                (e) => TarefaEntity(id: e.id, description: e.description, tarefa: e.tarefa),
              )
              .toList(),
        );
  }

  @override
  Future<int> insert(TarefaEntity entity) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<int> remover(TarefaEntity entity) {
    // TODO: implement remover
    throw UnimplementedError();
  }
}
