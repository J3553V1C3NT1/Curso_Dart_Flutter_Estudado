import 'package:flutter/material.dart';

import '../componentes/comida_item.dart';
import '../modelos/comidas.dart';

class FavoritosTela extends StatelessWidget {
  final List<Comidas> comidasFavorita;

  const FavoritosTela(this.comidasFavorita);

  @override
  Widget build(BuildContext context) {
    if (comidasFavorita.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: comidasFavorita.length,
        itemBuilder: (ctx, index) {
          return ComidaItem(comidasFavorita[index]);
        },
      );
    }
  }
}
