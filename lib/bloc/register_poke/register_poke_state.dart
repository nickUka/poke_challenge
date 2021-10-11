import 'dart:io';

class RegisterPokeState {
  final File? img;
  final String? name;
  List<String>? categories;
  final String? categoryValue;
  List<String>? types;
  final String? typeValues;
  List<String>? abilities;
  final String? abilityValues;
  final String? description;

  RegisterPokeState({
    this.img,
    this.name,
    this.categoryValue,
    this.typeValues,
    this.abilityValues,
    this.description,
  })  : abilities = [
          'Habilidade1',
          'Habilidade2',
          'Habilidade3',
          'Habilidade4',
          'Habilidade5',
          'Habilidade6',
        ],
        categories = [
          'Categoria1',
          'Categoria2',
          'Categoria3',
          'Categoria4',
        ],
        types = [
          'Tipo1',
          'Tipo2',
          'Tipo3',
          'Tipo4',
          'Tipo5',
          'Tipo6',
        ];

  RegisterPokeState copyWith(
      {File? img,
      String? name,
      List<String>? categories,
      String? categoryValue,
      List<String>? types,
      String? typeValues,
      List<String>? abilities,
      String? abilityValues,
      String? description}) {
    return RegisterPokeState(
      img: img ?? this.img,
      name: name ?? this.name,
      //categories: categories ?? this.categories,
      categoryValue: categoryValue ?? this.categoryValue,
      //types: types ?? this.types,
      typeValues: typeValues ?? this.typeValues,
      //abilities: abilities ?? this.abilities,
      abilityValues: abilityValues ?? this.typeValues,
      description: description ?? this.description,
    );
  }
}
