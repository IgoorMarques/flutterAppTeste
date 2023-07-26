import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String resposta;
  final void Function() quandoSelecionado;

  Respostas(this.resposta, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
        ),
        onPressed: quandoSelecionado,
        child: Text(resposta,
        style: const TextStyle(color: Colors.orange),),
      ),
    );
  }
}
