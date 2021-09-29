import 'package:flutter/material.dart';
import 'package:hello_world/models/pokemon.dart';
import 'package:hello_world/pokelist/widgets/modal_button.dart';

const modalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12.0,
);

void showPokemonInfo({
  required BuildContext ctx,
  required Pokemon pokemon,
}) {
  showModalBottomSheet(
    context: ctx,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Wrap(
          children: [
            Row(
              children: [
                Image.network(
                  pokemon.imgUrl!,
                  height: 135,
                  width: 135,
                ),
                const SizedBox(
                  width: 22.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${pokemon.id} ${pokemon.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      pokemon.category!,
                      style: modalTextStyle,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      pokemon.abilities!.join(", "),
                      style: modalTextStyle,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      pokemon.types!.join(", "),
                      style: modalTextStyle,
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Color(0xFFF2BE22),
                      size: 29.0,
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                  ],
                ),
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
                ModalButton(
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
