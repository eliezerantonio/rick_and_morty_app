import 'package:rick_and_morty_app/infrastructure/datasources/character_datasource_impl.dart';
import 'package:rick_and_morty_app/infrastructure/repositories/character_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/character_repository.dart';

part 'characters_repository_provider.g.dart';

@riverpod
CharacterRepository characterRepository(CharacterRepositoryRef ref) {
  return CharacterRepositoryImpl(CharacterDatasourceImpl());
}
