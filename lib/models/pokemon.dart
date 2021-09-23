class Pokemon {
  int? id;
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

  Pokemon.fromJson(Map json1, Map json2) {
    id = json1['id'];
    name = json1['name'];
    category = json2['genera'][7]['genus'];
    abilities = json1["abilities"].map(
      (x) {
        if (x['is_hidden'] == false) {
          return x['ability']['name'];
        }
      },
    ).toList();
    types = json1["types"]
        .map(
          (x) => x['type']['name'],
        )
        .toList();
    description = json2['flavor_text_entries'][6]['flavor_text'];
    print(description);
    isFav = false;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Pokemon { id: $id, name: $name,}';
  }
}
