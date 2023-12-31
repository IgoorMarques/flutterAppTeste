import 'package:flutter/cupertino.dart';
import 'package:primeiro_app_flutter/questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada].cast()['texto']),
        ...respostas.map((informacao) {
          return Respostas(informacao.cast()['texto'],
              () => responder(int.parse(informacao['nota'].toString())));
        })
      ],
    );
  }
}
