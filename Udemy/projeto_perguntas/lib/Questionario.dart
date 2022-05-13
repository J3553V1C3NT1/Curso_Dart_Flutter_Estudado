// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import './Questao.dart';
import './Resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Questao(perguntas[perguntaSelecionada]['texto'].toString()),
            const Text(''),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          children: <Widget>[
            ...respostas.map((resp) {
              return Resposta(
                resp['texto'],
                () => quandoResponder(resp['pontuacao']),
              );
            }).toList(),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          //height: 310,
          //width: 1000,
          child: Image.asset(
            'assets/images/usar.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
