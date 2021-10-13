import 'dart:io';

class Pokemon {
  int? id;
  File? img;
  String? imgUrl;
  String? name;
  String? category;
  List? abilities;
  List? types;
  String? description;
  bool? isFav;

  Pokemon({
    required this.id,
    required this.name,
    required this.category,
    required this.abilities,
    required this.types,
    required this.description,
    this.img,
    this.imgUrl,
    this.isFav = false,
  });

  Pokemon.fromJson(Map jsonPoke, Map jsonSpecies) {
    List aux = jsonPoke["abilities"].map(
      (item) {
        if (item['is_hidden'] == false) {
          return capitalize(item['ability']['name']);
        }
      },
    ).toList();
    aux.removeWhere((element) => element == null);

    id = jsonPoke['id'];
    imgUrl = jsonPoke['sprites']['other']['official-artwork']['front_default'];
    name = capitalize(jsonPoke['name']);
    category = capitalize(jsonSpecies['genera'][7]['genus'])
        .replaceAll(' Pokémon', '');
    abilities = aux;
    types = jsonPoke["types"]
        .map((item) => capitalize(item['type']['name']))
        .toList();
    description = jsonSpecies["flavor_text_entries"][6]['flavor_text']
        .replaceAll('\n', ' ');
    isFav = false;
  }
}

String capitalize(String toCapitalize) {
  return "${toCapitalize[0].toUpperCase()}${toCapitalize.substring(1)}";
}
