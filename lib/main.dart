import 'package:flutter/material.dart';

import './questionario.dart';
import './resultado.dart';

const _perguntas = [
  {
    'texto': 'Qual é a sua cor favorita?',
    'respostas': [
      {'texto': 'Preto', 'nota': 10},
      {'texto': 'Vermelho', 'nota': 4},
      {'texto': 'Verde', 'nota': 2},
      {'texto': 'Branco', 'nota': 7},
    ]
  },
  {
    'texto': 'Qual seu animal favorito?',
    'respostas': [
      {'texto': 'Coelho', 'nota': 10},
      {'texto': 'Gato', 'nota': 5},
      {'texto': 'Cachorro', 'nota': 6},
      {'texto': 'Papagaio', 'nota': 7},
    ]
  },
  {
    'texto': 'Qual sua comida favorita?',
    'respostas': [
      {'texto': 'Lasanha', 'nota': 10},
      {'texto': 'Churrasco', 'nota': 5},
      {'texto': 'Pizza', 'nota': 2},
      {'texto': 'Macarronada', 'nota': 1},
    ]
  }
];

main() {
  runApp(PerguntasApp());
}

class PerguntasAppState extends State<PerguntasApp> {
  var perguntaSelecionada = 0;
  var pontuacaoTotal = 0;

  void responder(int nota) {
    setState(() {
      perguntaSelecionada++;
      pontuacaoTotal += nota;
    });
    print(pontuacaoTotal);
  }

  void reiniciar(){
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: perguntaSelecionada,
                  responder: responder)
              : Resultado(pontuacaoTotal, reiniciar)),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  @override
  PerguntasAppState createState() {
    return PerguntasAppState();
  }
}
