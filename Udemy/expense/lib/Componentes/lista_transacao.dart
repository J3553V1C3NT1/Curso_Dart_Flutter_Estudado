import 'package:expenses/Modelos/transacao.dart';
import 'package:flutter/material.dart';
import '../Modelos/transacao.dart';
import './item_transacao.dart';

class ListaTransacao extends StatelessWidget {
  final List<Transacao> transacao;
  final void Function(String) remover;
  ListaTransacao(this.transacao, this.remover);
  @override
  Widget build(BuildContext context) {
    return transacao.isEmpty
        ? LayoutBuilder(
            builder: ((context, constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Container(
                    height: constraints.maxHeight * 0.10,
                    child: Text(
                      'Nenhum Transação Cadastrada',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            }),
          )
        : ListView.builder(
            itemCount: transacao.length,
            itemBuilder: (ctx, index) {
              final tr = transacao[index];
              return ItemTransacao(
                key: GlobalObjectKey(tr.id),
                tr: tr,
                Remover: remover,
              );
            },
            //children: [...transacao.map((tr) {}).toList()],
          );
  }
}
