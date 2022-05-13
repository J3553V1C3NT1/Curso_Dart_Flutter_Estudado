import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../Modelos/transacao.dart';

class ItemTransacao extends StatefulWidget {
  final Transacao tr;
  final void Function(String p1) Remover;
  const ItemTransacao({
    Key? key,
    required this.tr,
    required this.Remover,
  }) : super(key: key);

  @override
  State<ItemTransacao> createState() => _ItemTransacaoState();
}

class _ItemTransacaoState extends State<ItemTransacao> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.amber,
    Colors.blue,
    Colors.black,
  ];

  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();

    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('R\$${widget.tr.valor}')),
          ),
        ),
        title: Text(
          widget.tr.titulo,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat('d / MMM / y').format(widget.tr.data),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                onPressed: () => widget.Remover(widget.tr.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.Remover(widget.tr.id),
              ),
      ),
    );
  }
}
