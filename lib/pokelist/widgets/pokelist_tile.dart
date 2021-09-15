import 'package:flutter/material.dart';

class PokelistTile extends StatelessWidget {
  const PokelistTile({
    required this.index,
    required this.pokemon,
    this.isFav = false,
  });

  final int? index;
  final String? pokemon;
  final bool? isFav;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (index == 0)
          const SizedBox(
            height: 4.0,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: [
              const SizedBox(width: 24.0),
              CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0xFF1AA7D3),
                child: Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
                  width: 42,
                  height: 42,
                ),
              ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(
                      pokemon!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    const SizedBox(width: 4),
                    if ((index! + 1) % 2 == 0)
                      const Icon(
                        Icons.star,
                        color: Color(0xFFF2BE22),
                        size: 17.0,
                      ),
                  ]),
                  Text(
                    '#${index! + 1}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.grey),
                  ),
                ],
              ),
              Expanded(child: Container()),
              const Icon(
                Icons.chevron_right_rounded,
                size: 40.0,
                color: Color(0xFF333333),
              ),
              const SizedBox(width: 2.0)
            ],
          ),
        ),
        const Divider(
          thickness: 1.0,
          height: .0,
          indent: 90.0,
        )
      ],
    );
  }
}
