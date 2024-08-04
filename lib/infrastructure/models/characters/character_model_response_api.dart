import 'package:rick_and_morty_app/infrastructure/models/characters/character_model.dart';

class CharacterReponseApi {
  final Info info;
  final List<CharacterModel> characterModels;

  CharacterReponseApi({
    required this.info,
    required this.characterModels,
  });

  factory CharacterReponseApi.fromJson(Map<String, dynamic> json) => CharacterReponseApi(
        info: Info.fromJson(json["info"]),
        characterModels: List<CharacterModel>.from(json["results"].map((x) => CharacterModel.fromJson(x))),
      );
}

class Info {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
