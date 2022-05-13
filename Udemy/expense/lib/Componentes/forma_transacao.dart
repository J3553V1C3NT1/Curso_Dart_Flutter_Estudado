import 'package:flutter/material.dart';
import 'botao_adaptado.dart';
import 'texto_fildes_adaptado.dart';
import 'data_picker_adaptado.dart';

class FormaTransacao extends StatefulWidget {
  final void Function(String, double, DateTime) submissao;

  const FormaTransacao(this.submissao);

  @override
  State<FormaTransacao> createState() => _FormaTransacaoState();
}

class _FormaTransacaoState extends State<FormaTransacao> {
  final _controleDoTitulo = TextEditingController();
  final _controleDoValor = TextEditingController();
  DateTime _dataSelecionada = DateTime.now();

  _submissao() {
    final titulo = _controleDoTitulo.text;
    final valor = double.tryParse(_controleDoValor.text) ?? 0;

    if (titulo.isEmpty || valor <= 0 || _dataSelecionada == null) {
      return;
    }
    widget.submissao(titulo, valor, _dataSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              TextoFildesAdaptado(
                controller: _controleDoTitulo,
                onSubmitted: (_) => _submissao(),
                label: 'Título',
              ),
              TextoFildesAdaptado(
                controller: _controleDoValor,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submissao(),
                label: 'Valor (R\$)',
              ),
              DataPickerAdaptado(
                dataSelecionada: _dataSelecionada,
                onDateChanged: (newDate) {
                  setState(() {
                    _dataSelecionada = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  BotaoAdaptado(
                    label: 'Nova Transação',
                    onPressed: _submissao,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
