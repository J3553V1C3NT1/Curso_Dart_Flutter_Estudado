import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class BotaoAdaptado extends StatelessWidget {
  final String label;
  final Function() onPressed;

  BotaoAdaptado({
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            onPressed: onPressed,
          )
        : RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Colors.amber,
            child: Text(label),
            onPressed: onPressed,
          );
  }
}
