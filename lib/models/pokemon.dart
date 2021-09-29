class Pokemon {
  int? id;
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
    this.isFav = false,
  });

  Pokemon.fromJson(Map jsonPoke, Map jsonSpecies) {
    List aux = jsonPoke["abilities"].map(
      (item) {
        if (item['is_hidden'] == false)
          return capitalize(item['ability']['name']);
      },
    ).toList();
    aux.removeWhere((element) => element == null);

    this.id = jsonPoke['id'];
    this.imgUrl =
        jsonPoke['sprites']['other']['official-artwork']['front_default'];
    this.name = capitalize(jsonPoke['name']);
    this.category = capitalize(jsonSpecies['genera'][7]['genus']);
    this.abilities = aux;
    this.types = jsonPoke["types"]
        .map((item) => capitalize(item['type']['name']))
        .toList();
    this.description = jsonSpecies["flavor_text_entries"][6]['flavor_text']
        .replaceAll('\n', ' ');
    this.isFav = false;
  }
}

String capitalize(String toCapitalize) {
  return "${toCapitalize[0].toUpperCase()}${toCapitalize.substring(1)}";
}
