abstract class RegisterPokeEvent {
  const RegisterPokeEvent();
}

class OnChange extends RegisterPokeEvent {
  final String? name;
  final String? categoriesValue;
  final String? typesValue;
  final String? abilitiesValue;
  final String? description;

  const OnChange({
    this.name,
    this.categoriesValue,
    this.typesValue,
    this.abilitiesValue,
    this.description,
  });
}
