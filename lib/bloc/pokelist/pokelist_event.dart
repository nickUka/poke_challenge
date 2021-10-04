import 'package:pokemon_test/models/pokemon.dart';

class PokelistEvent {
  const PokelistEvent();
}

class PokelistFirstLoad extends PokelistEvent {}

class PokelistLoadMore extends PokelistEvent {}

class FavPokemon extends PokelistEvent {
  final int id;
  const FavPokemon({required this.id});
}

class PokelistToggleShowFav extends PokelistEvent {}
