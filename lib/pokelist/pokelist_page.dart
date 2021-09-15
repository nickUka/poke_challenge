import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hello_world/pokelist/widgets/pokelist_tile.dart';

class PokelistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) => PokelistTile(
        pokemon: 'Pikachu',
        index: i,
      ),
      itemCount: 20,
      physics: const BouncingScrollPhysics(),
    );
  }
}
