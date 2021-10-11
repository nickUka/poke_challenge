// ignore_for_file: annotate_overrides, overridden_fields

import 'package:pokemon_test/models/pokemon.dart';

class PokelistState {
  final List<Pokemon>? pokelist;
  int maxItems = 150;
  final int? currentItem;

  PokelistState({
    this.pokelist,
    this.currentItem,
    this.maxItems = 150,
  });
}

class PokelistLoadingState extends PokelistState {}

class PokelistLoadFailedState extends PokelistState {
  final String message;
  final List<Pokemon>? pokelist;
  final int? currentItem;

  PokelistLoadFailedState(this.message, {this.pokelist, this.currentItem})
      : super(
          pokelist: pokelist,
          currentItem: currentItem,
        );
}

class PokelistFavState extends PokelistState {
  final List<Pokemon> favPokelist;
  final List<Pokemon> originalPokelist;
  final int currentItem;

  PokelistFavState(
      {required this.favPokelist,
      required this.currentItem,
      required this.originalPokelist})
      : super(
          currentItem: currentItem,
          pokelist: originalPokelist,
        );
}
