import 'package:flutter/material.dart';

class PokelistTile extends StatelessWidget {
  const PokelistTile({
    required this.index,
    required this.pokemon,
    required this.imgUrl,
    required this.onTap,
    this.isFav = false,
  });

  final int? index;
  final String? pokemon;
  final String? imgUrl;
  final bool? isFav;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
                    imgUrl!,
                    width: 40,
                    height: 40,
                    loadingBuilder: (ctx, child, progress) {
                      return progress == null
                          ? child
                          : const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              ),
                            );
                    },
                    errorBuilder: (ctx, child, exception) {
                      return const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                      );
                    },
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
      ),
    );
  }
}
