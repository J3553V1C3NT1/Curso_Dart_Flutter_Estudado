import 'package:flutter/material.dart';

import '../componentes/categorias_item.dart';
import '../dados/dados_usados.dart';

class CategoriasTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: CATEGORIAS_USADAS.map((cat) {
        return CategoriaItem(cat);
      }).toList(),
    );
  }
}
