import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rick_and_morty_app/domain/entities/character_entity.dart';

import 'providers.dart';

part 'characters_provider.g.dart';

class CharacterState {
  final List<CharacterEntity> characters;
  final int currentIndex;
  final bool isLoading;

  CharacterState({required this.characters, required this.currentIndex, required this.isLoading});

  CharacterState copyWith({
    List<CharacterEntity>? characters,
    int? currentIndex,
    bool? isLoading,
  }) {
    return CharacterState(
      characters: characters ?? this.characters,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class Characters extends _$Characters {
  @override
  FutureOr<CharacterState> build() => CharacterState(
        characters: [],
        currentIndex: 1,
        isLoading: false,
      );

  Future<void> getAll() async {
    if (state.value!.isLoading) return;

    state = AsyncData(state.value!.copyWith(isLoading: true, currentIndex: state.value!.currentIndex));

    final newCharacters = await ref.read(characterRepositoryProvider).getAll(page: state.value!.currentIndex);

    state = AsyncData(
      state.value!.copyWith(
        characters: [...state.value!.characters, ...newCharacters],
        isLoading: false,
        currentIndex: state.value!.currentIndex + 1,
      ),
    );
  }
}
