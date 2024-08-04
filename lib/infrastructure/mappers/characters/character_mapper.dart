import 'package:rick_and_morty_app/domain/entities/entities.dart';
import 'package:rick_and_morty_app/infrastructure/models/characters/character_model.dart';

class CharacterMapper {
  static CharacterEntity characterModelToEntity(CharacterModel characterModel) => CharacterEntity(
        id: characterModel.id,
        name: characterModel.name,
        status: characterModel.status,
        species: characterModel.species,
        type: characterModel.type,
        gender: characterModel.gender,
        origin: characterModel.origin,
        location: characterModel.location,
        image: characterModel.image,
        episode: characterModel.episode,
        url: characterModel.url,
        created: characterModel.created,
      );
}

extension CharacterModelToEntity on CharacterModel {
  CharacterEntity characterModelToEntity() => CharacterEntity(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        origin: origin,
        location: location,
        image: image,
        episode: episode,
        url: url,
        created: created,
      );
}
