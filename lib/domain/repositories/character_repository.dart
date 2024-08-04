import '../entities/entities.dart';

mixin CharacterRepository {
  Future<List<CharacterEntity>> getAll({int page = 1});

  Future<CharacterEntity> getById(int id);
}
