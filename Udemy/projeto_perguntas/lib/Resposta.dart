import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Color.fromARGB(255, 252, 0, 0),
        color: Colors.black87,
        child: Text(
          texto,
          style: TextStyle(fontSize: 30),
        ),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
