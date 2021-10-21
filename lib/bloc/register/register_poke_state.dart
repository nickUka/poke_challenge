import 'dart:io';

import 'package:pokemon_test/bloc/navigation/navigation_bloc.dart';

class RegisterPokeState{
  File? img;
  String? name;
  List? abilitiesSelected;
  List? typesSelected;
  List? categorySelected;
  String? description;

  RegisterPokeState({
    this.img,
    this.name,
    this.abilitiesSelected,
    this.categorySelected,
    this.typesSelected,
    this.description,
  });

  RegisterPokeState copyWith({
    File? img,
    String? name, 
    List? abilitiesSelected,
    List? typesSelected,
    List? categorySelected,
    String? description
  }){
    return RegisterPokeState(
      img: img ?? this.img,
      name: name ?? this.name,
      abilitiesSelected: abilitiesSelected ?? this.abilitiesSelected,
      typesSelected: typesSelected ?? this.abilitiesSelected,
      categorySelected: categorySelected ?? this.categorySelected,
      description: description ?? this.description,
    );
  }
}