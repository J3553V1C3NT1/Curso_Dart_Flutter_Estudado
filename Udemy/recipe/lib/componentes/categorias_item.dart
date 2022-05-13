import 'package:flutter/material.dart';

import '../modelos/categoria.dart';
import 'package:recipe/utilitarios/rotas_app.dart';

class CategoriaItem extends StatelessWidget {
  final Categoria categoria;
  CategoriaItem(this.categoria);

  void _categoriaSelecionada(BuildContext context) {
    Navigator.of(context).pushNamed(
      RotasApp.CATEGORIAS_COMIDAS,
      arguments: categoria,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _categoriaSelecionada(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          categoria.titulo,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                categoria.cor.withOpacity(0.5),
                categoria.cor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}
