abstract class RegisterPokeEvent {
  const RegisterPokeEvent();
}

class OnChange extends RegisterPokeEvent {
  final String? name;
  final int? categoriesValue;
  final List<int>? typesValue;
  final List<int>? abilitiesValue;
  final String? description;

  const OnChange({
    this.name,
    this.categoriesValue,
    this.typesValue,
    this.abilitiesValue,
    this.description,
  });
}
