import 'package:rick_and_morty_app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/presentation/providers/characters_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<CharacterEntity> character(CharacterRef ref, int id) {
  return ref.read(characterRepositoryProvider).getById(id);
}
