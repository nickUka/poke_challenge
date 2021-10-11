class PokelistEvent {
  const PokelistEvent();
}

class PokelistFirstLoad extends PokelistEvent {}

class PokelistLoadMore extends PokelistEvent {}

class FavPokemon extends PokelistEvent {
  final int index;
  const FavPokemon({required this.index});
}

class PokelistToggleShowFav extends PokelistEvent {}

class AddNewPokemon extends PokelistEvent {
  final String name;
  final String category;
  final String type;
  final String abilities;
  final String description;

  const AddNewPokemon({
    required this.name,
    required this.category,
    required this.type,
    required this.abilities,
    required this.description,
  });
}
