class TarefasEntity {
  int? _id;
  String _description;

  TarefasEntity({required id, required description})
      : _id = id,
        _description = description;

  factory TarefasEntity.vazio() {
    return TarefasEntity(id: null, description: "");
  }

  int? get id => _id;

  String get description => _description;

  void set description(String description) => _description = description;
}
