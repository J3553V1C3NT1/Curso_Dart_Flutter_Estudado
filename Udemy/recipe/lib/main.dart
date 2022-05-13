import 'package:flutter/material.dart';

import 'telas/controle_telas.dart';
import 'telas/categorias_comidas_tela.dart';
import 'telas/detalhes_comidas_tela.dart';
import 'telas/configuracao_tela.dart';

import 'utilitarios/rotas_app.dart';
import 'modelos/comidas.dart';
import 'modelos/configuracao.dart';
import 'dados/dados_usados.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Configuracoes configuracoes = Configuracoes();
  List<Comidas> _avaliandoComida = COMIDAS_USADAS;
  List<Comidas> _comidasFavoritas = [];

  void _filtrarComida(Configuracoes configuracoes) {
    setState(() {
      this.configuracoes = configuracoes;

      _avaliandoComida = COMIDAS_USADAS.where((comidas) {
        final filtrarGluter = configuracoes.semGluter && !comidas.semGluter;
        final filtrarLactose = configuracoes.semLactose && !comidas.semLactose;
        final filtrarVegana = configuracoes.vegana && !comidas.vegana;
        final filtarvegetariana =
            configuracoes.vegetariana && !comidas.vegetariana;
        return !filtrarGluter &&
            !filtrarLactose &&
            !filtrarVegana &&
            !filtarvegetariana;
      }).toList();
    });
  }

  void _alterarFavorita(Comidas comidas) {
    setState(() {
      _comidasFavoritas.contains(comidas)
          ? _comidasFavoritas.remove(comidas)
          : _comidasFavoritas.add(comidas);
    });
  }

  bool _favorita(Comidas comidas) {
    return _comidasFavoritas.contains(comidas);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.pinkAccent,
        fontFamily: 'LibreBodoni',
        canvasColor: Color.fromARGB(255, 245, 243, 192),
        textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
            )),
      ),
      routes: {
        RotasApp.HOME: (ctx) => ControleTela(_comidasFavoritas),
        RotasApp.CATEGORIAS_COMIDAS: (ctx) =>
            CategoriasComidasTela(_avaliandoComida),
        RotasApp.COMIDA_DETALHES: (ctx) =>
            DetalhesComidaTela(_alterarFavorita, _favorita),
        RotasApp.CONFIGURACOES: (ctx) =>
            ConfiguracaoTela(configuracoes, _filtrarComida),
        // RotasApp.HOME: ((ctx) => CategoriasTela()),
        // RotasApp.CATEGORIAS_COMIDAS: ((ctx) => CategoriasComidasTela()),
      },
    );
  }
}
