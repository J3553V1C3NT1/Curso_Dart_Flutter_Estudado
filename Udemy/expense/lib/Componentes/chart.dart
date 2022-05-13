import 'package:expenses/Modelos/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transacao> trasacoesRecentes;
  Chart(this.trasacoesRecentes);

  List<Map<String, Object>> get grupoDeTransicao {
    return List.generate(7, (index) {
      final diaDaSemana = DateTime.now().subtract(
        Duration(days: index),
      );
      double somaTotal = 0.0;
      for (var i = 0; i < trasacoesRecentes.length; i++) {
        bool mesmoDia = trasacoesRecentes[i].data.day == diaDaSemana.day;
        bool mesmoMes = trasacoesRecentes[i].data.month == diaDaSemana.month;
        bool mesmoAno = trasacoesRecentes[i].data.year == diaDaSemana.year;

        if (mesmoDia && mesmoMes && mesmoAno) {
          somaTotal += trasacoesRecentes[i].valor;
        }
      }

      return {
        'dia': DateFormat.E().format(diaDaSemana)[0],
        'valor': somaTotal,
      };
    }).reversed.toList();
  }

  double get _valorTotalDaSemana {
    return grupoDeTransicao.fold(0.0, (soma, tr) {
      return soma + (tr['valor'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: grupoDeTransicao.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr['dia'] as String,
                valor: tr['valor'] as double,
                percentual: _valorTotalDaSemana == 0
                    ? 0
                    : (tr['valor'] as double) / _valorTotalDaSemana,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
