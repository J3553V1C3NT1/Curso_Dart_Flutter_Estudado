import 'package:flutter/material.dart';

import '../modelos/comidas.dart';

class DetalhesComidaTela extends StatelessWidget {
  final Function(Comidas) auterarFavitos;
  final bool Function(Comidas) favoritos;

  const DetalhesComidaTela(this.auterarFavitos, this.favoritos);

  Widget _criarTituloSelecionada(BuildContext context, String titulo) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        titulo,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _criarContainerSelecionado(Widget child) {
    return Container(
      width: 330,
      height: 250,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final comidas = ModalRoute.of(context)!.settings.arguments as Comidas;

    return Scaffold(
      appBar: AppBar(
        title: Text(comidas.titulo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                comidas.imagemDaNet,
                fit: BoxFit.cover,
              ),
            ),
            _criarTituloSelecionada(context, 'Ingredientes'),
            _criarContainerSelecionado(
              ListView.builder(
                itemCount: comidas.igredientes.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(comidas.igredientes[index]),
                    ),
                    color: Theme.of(context).accentColor,
                  );
                },
              ),
            ),
            _criarTituloSelecionada(context, 'Passos'),
            _criarContainerSelecionado(
              ListView.builder(
                itemCount: comidas.passos.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(comidas.passos[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(favoritos(comidas) ? Icons.star : Icons.star_border),
        onPressed: () {
          auterarFavitos(comidas);
        },
      ),
    );
  }
}
