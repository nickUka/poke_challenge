import 'dart:io';

import 'package:pokemon_test/bloc/register/register_poke_bloc.dart';

class RegisterPokeEvent {
  File? img;
  String? name;
  List? abilitiesSelected;
  List? typesSelected;
  List? categorySelected;
  String? description;

  RegisterPokeEvent({
    this.img,
    this.name,
    this.abilitiesSelected,
    this.categorySelected,
    this.typesSelected,
    this.description,
  });
}

class RegisterPokeCleanEvent extends RegisterPokeEvent{}