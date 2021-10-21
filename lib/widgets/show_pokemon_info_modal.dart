import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_bloc.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_event.dart';
import 'package:pokemon_test/bloc/pokelist/pokelist_state.dart';
import 'package:pokemon_test/models/pokemon.dart';
import 'package:pokemon_test/widgets/poke_button.dart';

const modalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12.0,
);

void showPokemonInfo({
  required BuildContext ctx,
  required Pokemon pokemon,
  required int index,
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
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 60,
                  backgroundImage:
                      pokemon.img == null ? null : FileImage(pokemon.img!),
                  child: pokemon.imgUrl == null
                      ? null
                      : Image(
                          image: NetworkImage(pokemon.imgUrl!),
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                          loadingBuilder: (ctx, child, progress) {
                            return progress == null
                                ? child
                                : Container(
                                    width: 120.0,
                                    height: 120.0,
                                    padding: const EdgeInsets.all(15.0),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 5.0,
                                    ),
                                  );
                          },
                          errorBuilder: (ctx, child, exception) {
                            return const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 100,
                              ),
                            );
                          },
                        ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: mediaWidth <= 360
                          ? mediaWidth * .47
                          : mediaWidth * .52),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              '#${index + 1} ${pokemon.name}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            flex: 6,
                          ),
                          BlocBuilder<PokelistBloc, PokelistState>(
                            builder: (context, state) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Icon(
                                  pokemon.isFav!
                                      ? Icons.star_rounded
                                      : Icons.star_outline_rounded,
                                  color: const Color(0xFFF2BE22),
                                  size: 29.0,
                                ),
                                onTap: () => context
                                    .read<PokelistBloc>()
                                    .add(FavPokemon(index: index)),
                              );
                            },
                          )
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
            Center(
              child: Column(
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
