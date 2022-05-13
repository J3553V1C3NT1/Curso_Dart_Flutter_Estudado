import 'dart:ffi';

import 'package:flutter/material.dart';

import '../componentes/main_drawer.dart';
import '../modelos/configuracao.dart';

class ConfiguracaoTela extends StatefulWidget {
  final Configuracoes configacoes;
  final Function(Configuracoes) mudancaConfiguracao;

  const ConfiguracaoTela(this.configacoes, this.mudancaConfiguracao);

  @override
  _ConfiguracoesTelaState createState() => _ConfiguracoesTelaState();
}

class _ConfiguracoesTelaState extends State<ConfiguracaoTela> {
  Configuracoes configacoes = Configuracoes();

  @override
  void initState() {
    super.initState();
    configacoes = widget.configacoes;
  }

  Widget _createSwitch(
    String titulo,
    String subtitle,
    bool valor,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(titulo),
      subtitle: Text(subtitle),
      value: valor,
      onChanged: (valor) {
        onChanged(valor);
        widget.mudancaConfiguracao(configacoes);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutén',
                  'Só exibe refeições sem glúten!',
                  configacoes.semGluter,
                  (valor) => setState(() => configacoes.semGluter = valor),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose!',
                  configacoes.semLactose,
                  (valor) => setState(() => configacoes.semLactose = valor),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas!',
                  configacoes.vegana,
                  (valor) => setState(() => configacoes.vegana = valor),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas!',
                  configacoes.vegetariana,
                  (valor) => setState(() => configacoes.vegetariana = valor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
