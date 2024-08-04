import '../entities/entities.dart';

abstract class CharacterDatasource {
  Future<List<CharacterEntity>> getAll({int page = 1});

  Future<CharacterEntity> getById(int id);
}
