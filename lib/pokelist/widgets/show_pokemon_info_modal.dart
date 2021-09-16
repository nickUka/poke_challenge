import 'package:flutter/material.dart';
import 'package:hello_world/pokelist/widgets/modal_button.dart';

const modalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12.0,
);

void showPokemonInfo(BuildContext ctx, url) {
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
                  url,
                  height: 130.0,
                ),
                const SizedBox(
                  width: 22.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#2 Pikachu',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Categoria',
                      style: modalTextStyle,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Habilidades',
                      style: modalTextStyle,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Tipo',
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
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper ante ac venenatis consequat. Donec diam dui, aliquam vel velit id, gravida sagittis ex.Suspendisse potenti. Suspendisse cursus, lectus a sodales vulputate.',
                  textAlign: TextAlign.justify,
                  style: modalTextStyle,
                ),
                const SizedBox(height: 20.0),
                ModalButton(
                  title: "Gotta Catch 'Em All",
                  onTap: () {},
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
