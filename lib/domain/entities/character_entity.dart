class CharacterEntity {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String origin;
  String location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
}
