import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int adivinhasCertas;
  final int quantidadeDeQuestoes;
  final void Function() quandoEstiverNoInicio;
  Object get fraseFinal {
    if (adivinhasCertas < 16) {
      return 'Você acertou só $adivinhasCertas/$quantidadeDeQuestoes adivinhas, mas ainda dá para melhorar.';
    } else if (adivinhasCertas < 21) {
      return 'Você fez uma boa pontuação, acertou $adivinhasCertas/$quantidadeDeQuestoes  adivinhas, parabéns pelo esforço.';
    } else if (adivinhasCertas < 25) {
      return 'Você acertou bastante, $adivinhasCertas/$quantidadeDeQuestoes  adivinhas, você está quase no topo!';
    } else if (adivinhasCertas == 25) {
      return 'Parabéns você acertou todas as $adivinhasCertas/$quantidadeDeQuestoes  adivinhas.';
    }
  }

  Resultado(this.adivinhasCertas, this.quandoEstiverNoInicio,
      this.quantidadeDeQuestoes);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
            child: Text(
          fraseFinal,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        )),
        const SizedBox(
          height: 5,
        ),
        FlatButton(
          child: const Text(
            'Responder novamente',
            style: TextStyle(fontSize: 20),
          ),
          textColor: Colors.red,
          onPressed: quandoEstiverNoInicio,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          //height: 310,
          // width: 1000,
          child: Image.asset(
            'assets/images/usar.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //height: 115,
              // width: 110,
              child: Image.asset(
                'assets/images/usar2.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        )
      ],
    );
  }
}
