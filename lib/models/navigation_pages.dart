// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pokemon_test/screens/pokedex_page.dart';
import 'package:pokemon_test/screens/pokelist_page.dart';
import 'package:pokemon_test/screens/register_page.dart';

const POKEDEX = 0;
const POKELIST = 1;
const REGISTER = 2;

const List<Widget> Pages = [
  PokedexPage(
    index: POKEDEX,
  ),
  PokelistPage(
    index: POKELIST,
  ),
  RegisterPage(
    index: REGISTER,
  ),
];
