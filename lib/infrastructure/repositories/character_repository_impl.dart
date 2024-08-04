import 'package:rick_and_morty_app/domain/entities/character_entity.dart';

import '../../domain/datasource/character_datasource.dart';
import '../../domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource datasource;

  CharacterRepositoryImpl(this.datasource);

  @override
  Future<List<CharacterEntity>> getAll({int page = 1}) async {
    return await datasource.getAll(page: page);
  }

  @override
  Future<CharacterEntity> getById(int id) async {
    return await datasource.getById(id);
  }
}
