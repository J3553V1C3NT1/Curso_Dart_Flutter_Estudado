import 'dart:math';

import 'package:flutter/material.dart';
import './Questionario.dart';
import './Resposta.dart';
import './Resultado.dart';

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key key}) : super(key: key);

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }

  void add(Resposta resposta) {}
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final List<int> _armazenadorDeNumeroDeQuestao = [];
  //List<int> numberList=[];
  Random random = Random();
  int cont = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        //_perguntaSelecionada++; Adicionado
        _perguntaSelecionada = Random().nextInt(_perguntas.length);
        _armazenadorDeNumeroDeQuestao.add(_perguntaSelecionada);
        //Arranje um jeito de ver se o item já está na lista, se tiver, não chame a pergunta
        _pontuacaoTotal += pontuacao;

        // if (_armazenadorDeNumeroDeQuestao.length < _perguntas.length) {
        //   int randomNumber = Random().nextInt(_perguntas.length);
        //   if (!_armazenadorDeNumeroDeQuestao.contains(randomNumber)) {
        //     _armazenadorDeNumeroDeQuestao.add(randomNumber);
        //     _perguntaSelecionada = randomNumber;
        //     _pontuacaoTotal += pontuacao;
        //   }
        // }

        /*if (cont != _armazenadorDeNumeroDeQuestao.length) {
          _perguntaSelecionada = _armazenadorDeNumeroDeQuestao[cont];
          _pontuacaoTotal += pontuacao;
          cont++;
        }*/
      });
    }
  }

  void _voltarAoInicio() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
      _armazenadorDeNumeroDeQuestao.clear();
    });
  }

  bool get temPerguntaSelecionada {
    return _armazenadorDeNumeroDeQuestao.length < (_perguntas.length);
    //return _armazenadorDeNumeroDeQuestao.contains(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.greenAccent,
          fontFamily: 'LibreBodoni'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('O que é, o que é?'),
        ),
        body: SingleChildScrollView(
          child: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder,
                )
              : Resultado(_pontuacaoTotal, _voltarAoInicio, _perguntas.length),
        ),
      ),
    );
  }

  final _perguntas = const [
    {
      'texto': 'Feito para andar e não anda.',
      'respostas': [
        {'texto': 'Chinela', 'pontuacao': 0},
        {'texto': 'Carro', 'pontuacao': 0},
        {'texto': 'Rua', 'pontuacao': 1},
        {'texto': 'Ponte', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Dá muitas voltas e não sai do lugar.',
      'respostas': [
        {'texto': 'Terra', 'pontuacao': 0},
        {'texto': 'Roda', 'pontuacao': 0},
        {'texto': 'Chave', 'pontuacao': 0},
        {'texto': 'Relógio', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Não se come, mas é bom para se comer.',
      'respostas': [
        {'texto': 'Prato', 'pontuacao': 0},
        {'texto': 'Talher', 'pontuacao': 1},
        {'texto': 'Hashi', 'pontuacao': 0},
        {'texto': 'Água', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Nunca volta, embora nunca tenha ido.',
      'respostas': [
        {'texto': 'Passado', 'pontuacao': 1},
        {'texto': 'Hora', 'pontuacao': 0},
        {'texto': 'Tempo', 'pontuacao': 0},
        {'texto': 'Nascimento', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quanto mais se tira mais se aumenta.',
      'respostas': [
        {'texto': 'Hidra', 'pontuacao': 0},
        {'texto': 'Água', 'pontuacao': 0},
        {'texto': 'Areia', 'pontuacao': 0},
        {'texto': 'Buraco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Quanto mais cresce, mais baixo fica.',
      'respostas': [
        {'texto': 'Árvore', 'pontuacao': 0},
        {'texto': 'Rabo de cavalo', 'pontuacao': 1},
        {'texto': 'Cabelo', 'pontuacao': 0},
        {'texto': 'Raiz', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Mesmo atravessando o rio não se molha.',
      'respostas': [
        {'texto': 'Ponte', 'pontuacao': 1},
        {'texto': 'Sombra', 'pontuacao': 0},
        {'texto': 'Navio', 'pontuacao': 0},
        {'texto': 'Avião', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Pode passar diante do sol sem fazer sombra.',
      'respostas': [
        {'texto': 'Fantasma', 'pontuacao': 0},
        {'texto': 'Vidros', 'pontuacao': 0},
        {'texto': 'Vento', 'pontuacao': 1},
        {'texto': 'Chuva', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Tem dez ou mais cabeças, mas não sabe pensar.',
      'respostas': [
        {'texto': 'Alho', 'pontuacao': 0},
        {'texto': 'Sistema solar', 'pontuacao': 0},
        {'texto': 'Mão', 'pontuacao': 0},
        {'texto': 'Caixa de fósforos', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Enche uma casa, mas não enche uma mão.',
      'respostas': [
        {'texto': 'Passarinho', 'pontuacao': 0},
        {'texto': 'Botão', 'pontuacao': 1},
        {'texto': 'Umidade', 'pontuacao': 0},
        {'texto': 'Ar', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Nasce a socos e morre a facadas.',
      'respostas': [
        {'texto': 'Hematomas', 'pontuacao': 0},
        {'texto': 'Bife', 'pontuacao': 0},
        {'texto': 'Pão', 'pontuacao': 1},
        {'texto': 'Tecido', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quanto maior menos se vê',
      'respostas': [
        {'texto': 'Escuridão', 'pontuacao': 1},
        {'texto': 'Buraco', 'pontuacao': 0},
        {'texto': 'Oceano', 'pontuacao': 0},
        {'texto': 'Claridade', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Faz virar a cabeça de um homem.',
      'respostas': [
        {'texto': 'Fama', 'pontuacao': 0},
        {'texto': 'Dinheiro', 'pontuacao': 0},
        {'texto': 'Mulher', 'pontuacao': 0},
        {'texto': 'Pescoço', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Tem pomar e no seu paletó.',
      'respostas': [
        {'texto': 'Flor', 'pontuacao': 0},
        {'texto': 'Botão', 'pontuacao': 0},
        {'texto': 'Manga', 'pontuacao': 1},
        {'texto': 'A letra P', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Mantém sempre o mesmo tamanho, não importa o peso.',
      'respostas': [
        {'texto': 'Algodão', 'pontuacao': 0},
        {'texto': 'Balança', 'pontuacao': 1},
        {'texto': 'Nuvem', 'pontuacao': 0},
        {'texto': 'Terra', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          'Nasce no Rio, vive no Rio e morre no Rio, mas não está sempre molhado.',
      'respostas': [
        {'texto': 'Carioca', 'pontuacao': 1},
        {'texto': 'Água', 'pontuacao': 0},
        {'texto': 'Sal', 'pontuacao': 0},
        {'texto': 'Sapo', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Num instante se quebra quando se diz o nome dele.',
      'respostas': [
        {'texto': 'Segredo', 'pontuacao': 0},
        {'texto': 'Vidro', 'pontuacao': 0},
        {'texto': 'Terno', 'pontuacao': 0},
        {'texto': 'Silêncio', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Cai de pé e corre deitado.',
      'respostas': [
        {'texto': 'Água', 'pontuacao': 0},
        {'texto': 'Chuva', 'pontuacao': 1},
        {'texto': 'Peixe', 'pontuacao': 0},
        {'texto': 'Pé', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Põe-se na mesa, parte-se, reparte-se, mas não se come.',
      'respostas': [
        {'texto': 'Guardanapos', 'pontuacao': 0},
        {'texto': 'Cadeira', 'pontuacao': 0},
        {'texto': 'Uno', 'pontuacao': 1},
        {'texto': 'Faca', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Fica cheio de boca para baixo e vazio de boca para cima.',
      'respostas': [
        {'texto': 'Copo', 'pontuacao': 0},
        {'texto': 'Pote', 'pontuacao': 0},
        {'texto': 'Balão', 'pontuacao': 0},
        {'texto': 'Chapéu', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Quanto mais se perde mais se tem.',
      'respostas': [
        {'texto': 'Sono', 'pontuacao': 1},
        {'texto': 'Vida', 'pontuacao': 0},
        {'texto': 'Buraco', 'pontuacao': 0},
        {'texto': 'Sombra', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'É grande antes de ser pequena.',
      'respostas': [
        {'texto': 'Ponto', 'pontuacao': 0},
        {'texto': 'Mola', 'pontuacao': 0},
        {'texto': 'Vela', 'pontuacao': 1},
        {'texto': 'Lente', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Passa a vida na janela e mesmo dentro de casa está fora dela.',
      'respostas': [
        {'texto': 'Botão', 'pontuacao': 1},
        {'texto': 'Porta', 'pontuacao': 0},
        {'texto': 'Ombreira', 'pontuacao': 0},
        {'texto': 'Maçaneta', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quebra quando se fala.',
      'respostas': [
        {'texto': 'Silêncio', 'pontuacao': 0},
        {'texto': 'Vidro', 'pontuacao': 0},
        {'texto': 'Terno', 'pontuacao': 0},
        {'texto': 'Segredo', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Voa sem ter asas e chora sem ter olhos.',
      'respostas': [
        {'texto': 'Pipa', 'pontuacao': 0},
        {'texto': 'Nuvem', 'pontuacao': 1},
        {'texto': 'Chuveiro', 'pontuacao': 0},
        {'texto': 'Foguete', 'pontuacao': 0},
      ],
    },
  ];
}
