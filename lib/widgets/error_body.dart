import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Erro!',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
