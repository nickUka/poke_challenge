import 'dart:io';

abstract class RegisterPokeEvent {
  const RegisterPokeEvent();
}

class OnChange extends RegisterPokeEvent {
  final File? image;
  final String? name;
  final String? categoriesValue;
  final String? typesValue;
  final String? abilitiesValue;
  final String? description;

  const OnChange({
    this.image,
    this.name,
    this.categoriesValue,
    this.typesValue,
    this.abilitiesValue,
    this.description,
  });
}
