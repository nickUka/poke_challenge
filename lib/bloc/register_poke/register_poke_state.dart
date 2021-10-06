import 'dart:io';

class RegisterPokeState {
  final File? img;
  final String? name;
  final List<String>? categories;
  final int? categoryValue;
  final List<String>? types;
  final List<int>? typeValues;
  final List<String>? abilities;
  final List<int>? abilityValues;
  final String? description;

  const RegisterPokeState({
    this.img,
    this.name,
    this.categories,
    this.categoryValue,
    this.types,
    this.typeValues,
    this.abilities,
    this.abilityValues,
    this.description,
  });

  RegisterPokeState copyWith(
      {File? img,
      String? name,
      List<String>? categories,
      int? categoryValue,
      List<String>? types,
      List<int>? typeValues,
      List<String>? abilities,
      List<int>? abilityValues,
      String? description}) {
    return RegisterPokeState(
      img: img ?? this.img,
      name: name ?? this.name,
      categories: categories ?? this.categories,
      categoryValue: categoryValue ?? this.categoryValue,
      types: types ?? this.types,
      typeValues: typeValues ?? this.typeValues,
      abilities: abilities ?? this.abilities,
      abilityValues: abilityValues ?? this.typeValues,
      description: description ?? this.description,
    );
  }
}
