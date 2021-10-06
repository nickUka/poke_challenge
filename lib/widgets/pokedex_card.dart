import 'package:flutter/material.dart';

class PokedexCard extends StatelessWidget {
  const PokedexCard({this.title, this.actionDesc, this.onTap, Key? key})
      : super(key: key);
  final String? title;
  final String? actionDesc;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 155, minHeight: 110),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(9.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
              ),
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(9.0),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    actionDesc!,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
