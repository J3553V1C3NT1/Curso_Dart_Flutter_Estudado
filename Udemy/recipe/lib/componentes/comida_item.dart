import 'package:flutter/material.dart';

import '../modelos/comidas.dart';
import '../utilitarios/rotas_app.dart';

class ComidaItem extends StatelessWidget {
  final Comidas comidas;

  const ComidaItem(this.comidas);

  void _comidaSelecionada(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      RotasApp.COMIDA_DETALHES,
      arguments: comidas,
    )
        .then((resultado) {
      if (resultado == null) {
        print('Sem resultado!');
      } else {
        print('O nome da refeição é $resultado.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _comidaSelecionada(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    comidas.imagemDaNet,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      comidas.titulo,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('${comidas.duracao} min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(comidas.complexidadeTexto),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(comidas.custoTexto),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
