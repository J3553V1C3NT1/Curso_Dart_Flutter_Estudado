import 'package:flutter/material.dart';

import '../componentes/comida_item.dart';
import '../modelos/categoria.dart';
import '../modelos/comidas.dart';

class CategoriasComidasTela extends StatelessWidget {
  final List<Comidas> comidas;

  const CategoriasComidasTela(this.comidas);

  @override
  Widget build(BuildContext context) {
    final categoria = ModalRoute.of(context)!.settings.arguments as Categoria;

    final categoriasComida = comidas.where((comidas) {
      return comidas.categorias.contains(categoria.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.titulo),
      ),
      body: ListView.builder(
        itemCount: categoriasComida.length,
        itemBuilder: (ctx, index) {
          return ComidaItem(categoriasComida[index]);
        },
      ),
    );
  }
}
