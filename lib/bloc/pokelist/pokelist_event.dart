import 'dart:io';

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
  final File image;
  final String name;
  final String category;
  final List types;
  final List abilities;
  final String description;

  const AddNewPokemon({
    required this.image,
    required this.name,
    required this.category,
    required this.types,
    required this.abilities,
    required this.description,
  });
}
