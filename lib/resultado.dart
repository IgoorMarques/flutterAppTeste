import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciar;

  Resultado(this.pontuacao, this.quandoReiniciar);

  String get freseResultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você manja muito!';
    } else if (pontuacao < 16) {
      return 'Nossa, você é emais!!';
    } else {
      return 'Sem igual!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              '$freseResultado\npontuação: $pontuacao',
              style: const TextStyle(fontSize: 28),
            ),
          ),
          ElevatedButton(onPressed: quandoReiniciar,
              child: const Text('Reiniciar?', style: TextStyle(color: Colors.deepOrange),))
        ]);
  }
}
