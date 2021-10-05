import 'package:flutter/material.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Center(
          child: CircularProgressIndicator(
        color: Theme.of(context).accentColor,
        backgroundColor: Colors.black12,
      )),
    );
  }
}
