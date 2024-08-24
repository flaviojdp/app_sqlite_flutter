
class TarefasEntity {
  int? _id;
  String _description;

  TarefasEntity({required id, required description})
    : _id = id, _description = description;

  int? get id => _id;
  String get description => _description;
}