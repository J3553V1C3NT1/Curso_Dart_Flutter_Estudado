import 'package:flutter/material.dart';

import 'categorias_tela.dart';
import 'favoritos_tela.dart';
import '../componentes/main_drawer.dart';
import '../modelos/comidas.dart';

class ControleTela extends StatefulWidget {
  final List<Comidas> comidaFavorita;

  const ControleTela(this.comidaFavorita);

  @override
  _ControleTelaState createState() => _ControleTelaState();
}

class _ControleTelaState extends State<ControleTela> {
  int _numTelaSelecionada = 0;

  final List<String> _titulo = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  List<Widget> _telas = [];

  @override
  void initState() {
    super.initState();
    _telas = [
      CategoriasTela(),
      FavoritosTela(widget.comidaFavorita),
    ];
  }

  _telaSelecionada(int index) {
    setState(() {
      _numTelaSelecionada = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo[_numTelaSelecionada]),
      ),
      drawer: MainDrawer(),
      body: _telas[_numTelaSelecionada],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _telaSelecionada,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _numTelaSelecionada,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
