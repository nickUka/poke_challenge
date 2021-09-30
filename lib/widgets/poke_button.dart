import 'package:flutter/material.dart';

class PokeButton extends StatelessWidget {
  const PokeButton({this.onTap, this.title});

  final void Function()? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.0),
        color: Color(0xFF048ABF),
        boxShadow: [
          BoxShadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0,
              color: Color(0x40000000)),
        ],
      ),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(17.0),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
