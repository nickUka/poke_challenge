// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pokemon_test/pages/pokedex_page.dart';
import 'package:pokemon_test/pages/pokelist_page.dart';
import 'package:pokemon_test/pages/register_page.dart';

const POKEDEX = 0;
const POKELIST = 1;
const REGISTER = 2;

List<Widget> Pages = [
  const PokedexPage(
    index: POKEDEX,
  ),
  const PokelistPage(
    index: POKELIST,
  ),
  RegisterPage(
    index: REGISTER,
  ),
];
