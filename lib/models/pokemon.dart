class Pokemon {
  int? id;
  String? imgUrl;
  String? name;
  String? categoryUrl;
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

  Pokemon.fromJson(Map json) {
    id = json['id'];
    imgUrl = json['sprites']['other']['official-artwork']['front_default'];
    name = json['name'];
    abilities = json["abilities"].map(
      (x) {
        if (x['is_hidden'] == false) {
          return x['ability']['name'];
        }
      },
    ).toList();
    types = json["types"]
        .map(
          (x) => x['type']['name'],
        )
        .toList();
    isFav = false;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Pokemon { id: $id, name: $name,}';
  }
}
