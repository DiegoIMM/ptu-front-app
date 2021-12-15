import 'package:flutter/material.dart';

class ExamenPage extends StatefulWidget {
  final argument;

  ExamenPage({Key? key, required this.argument}) : super(key: key);

  @override
  _ExamenPageState createState() => _ExamenPageState();
}

class _ExamenPageState extends State<ExamenPage> {
  dynamic question = [
    {
      "question": r"""$k=3^x+3^{-x}$, entonces $9^x + 9 ^{-x}$""",
      "alternatives": [
        {"text": r"""$k^2$""", "correct": false},
        {"text": r"""$k^2+2$""", "correct": false},
        {"text": r"""$k^2-2$""", "correct": false},
        {"text": r"""$k^2-1$""", "correct": false},
        {"text": r"""$3k$""", "correct": true}
      ]
    },
    {
      "question": r"""$k=32^x+32^{-x}$, entonces $9^x + 9 ^{-x}$""",
      "alternatives": [
        {"text": r"""$k^22$""", "correct": false},
        {"text": r"""$k^22+2$""", "correct": false},
        {"text": r"""$k^22-2$""", "correct": false},
        {"text": r"""$k^22-1$""", "correct": false},
        {"text": r"""$31k$""", "correct": true}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Examen'),
        ),
        body: ListView(
          children: [],
        ));
  }
}
