import 'package:flutter/material.dart';
import 'package:hello_world/models/pokemon.dart';
import 'package:hello_world/widgets/poke_button.dart';

const modalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12.0,
);

void showPokemonInfo({
  required BuildContext ctx,
  required Pokemon pokemon,
}) {
  final mediaWidth = MediaQuery.of(ctx).size.width;
  showModalBottomSheet(
    context: ctx,
    isScrollControlled: true,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Wrap(
          children: [
            Row(
              children: [
                Image(
                  image: NetworkImage(pokemon.imgUrl!),
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: mediaWidth <= 360
                          ? mediaWidth * .47
                          : mediaWidth * .54),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              '#${pokemon.id} ${pokemon.name}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            flex: 6,
                          ),
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFF2BE22),
                            size: 29.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Category: ' + pokemon.category!,
                        style: modalTextStyle,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Abilities: ' + pokemon.abilities!.join(",\n"),
                        style: modalTextStyle,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Type: ' + pokemon.types!.join(", "),
                        style: modalTextStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 24.0),
                Text(
                  pokemon.description!,
                  textAlign: TextAlign.justify,
                  style: modalTextStyle,
                ),
                const SizedBox(height: 20.0),
                PokeButton(
                  title: "Gotta Catch 'Em All",
                  onTap: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      );
    },
    backgroundColor: const Color(0xFF5CC8F2),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
    ),
  );
}
