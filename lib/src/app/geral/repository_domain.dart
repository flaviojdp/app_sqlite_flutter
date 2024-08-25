abstract class RepositoryDomain<T> {
  Future<List<T>> getAll();

  Future<int> insert(T entity);

  Future<int> editar(T entity);

  Future<int> remover(T entity);
}
