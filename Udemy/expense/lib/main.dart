import 'package:expenses/Componentes/chart.dart';
import 'package:expenses/Componentes/forma_transacao.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import './Componentes/forma_transacao.dart';
import './Componentes/lista_transacao.dart';
import 'Componentes/chart.dart';
import '../Modelos/transacao.dart';

main() => runApp(ExpensesApp()); // Executando o app

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key})
      : super(
            key: key); //Chave dos elementos | super passar informaçã para o pai
  final ThemeData tema = ThemeData(); // Passando o tema para uma variavel

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            //Cor dos elementos
            primary: Colors.redAccent,
            secondary: Colors.green,
          ),
          textTheme: tema.textTheme.copyWith(
            //Caracteristicas de texto
            headline6: const TextStyle(
              fontFamily: 'LibreBodoni',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            button: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transacao> _transacao = [];
  var _ixibirGrafico = false;

  List<Transacao> get _trasacoesRecentes {
    return _transacao.where((tr) {
      return tr.data.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _addTransacao(String titulo, double valor, DateTime data) {
    final newtransacao = Transacao(
      id: Random().nextDouble().toString(),
      titulo: titulo,
      valor: valor,
      data: data,
    );
    setState(() {
      _transacao.add(newtransacao);
    });
    Navigator.of(context).pop();
  }

  _deletarTransacao(String id) {
    setState(() {
      _transacao.removeWhere((tr) => tr.id == id);
    });
  }

  _abrirModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return FormaTransacao(_addTransacao);
        });
  }

  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(
            onTap: fn,
            child: Icon(icon),
          )
        : IconButton(icon: Icon(icon), onPressed: fn);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool modoPaisagem = mediaQuery.orientation == Orientation.landscape;

    final listaIcon = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final listachart =
        Platform.isIOS ? CupertinoIcons.refresh : Icons.bar_chart;

    final action = [
      if (modoPaisagem)
        _getIconButton(
          _ixibirGrafico ? listaIcon : listachart,
          () {
            setState(() {
              _ixibirGrafico = !_ixibirGrafico;
            });
          },
        ),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add_outlined,
        () => _abrirModal(context),
      ),
    ];

    final PreferredSizeWidget appBar =
        AppBar(title: const Text('Despesas Pessoais'), actions: action);

    final alturaDoDispo = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /*if (modoPaisagem)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Ixibir Gráfico'),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _ixibirGrafico,
                    onChanged: (valor) {
                      setState(() {
                        _ixibirGrafico = valor;
                      });
                    },
                  ),
                ],
              ),*/
            if (_ixibirGrafico || !modoPaisagem)
              Container(
                height: alturaDoDispo * (modoPaisagem ? 1 : 0.25),
                child: Chart(_trasacoesRecentes),
              ),
            if (!_ixibirGrafico || !modoPaisagem)
              Container(
                  height: alturaDoDispo * (modoPaisagem ? 1 : 0.75),
                  child:
                      ListaTransacao(_transacao.toList(), _deletarTransacao)),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Despesas Pessoais'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: action,
              ),
            ),
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add_outlined),
                    onPressed: () => _abrirModal(context),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
