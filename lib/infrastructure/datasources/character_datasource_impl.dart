import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/infrastructure/mappers/characters/character_mapper.dart';

import '../../domain/datasource/character_datasource.dart';
import '../models/characters/characters.dart';

class CharacterDatasourceImpl implements CharacterDatasource {
  final _dio = Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/api"));
  @override
  Future<List<CharacterEntity>> getAll({int page = 1}) async {
    final response = await _dio.get("/character", queryParameters: {"page": page});

    return CharacterReponseApi.fromJson(response.data).characterModels.map((character) => CharacterMapper.characterModelToEntity(character)).toList();
  }

  @override
  Future<CharacterEntity> getById(int id) async {
    final response = await _dio.get("/character/$id");
    return CharacterModel.fromJson(response.data).characterModelToEntity();
  }
}
