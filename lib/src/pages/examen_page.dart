import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class ExamenPage extends StatefulWidget {
  final argument;

  const ExamenPage({Key? key, required this.argument}) : super(key: key);

  @override
  _ExamenPageState createState() => _ExamenPageState();
}

class _ExamenPageState extends State<ExamenPage> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('AlertDialog Title'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: const <Widget>[
                      Text('This is a demo alert dialog.'),
                      Text('Would you like to approve of this message?'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Approve'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    });
  }

  final List<dynamic> question = [
    {
      "question":
          r"""$k=3^x+3^{-x}$, entonces $9^x + 9 ^{-x}$ <h2>hola</h2> <img src='https://images.unsplash.com/photo-1639588660349-e9b44468e70a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80' styile='width=100%'>""",
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
    final List<Widget> questionsSliders = question
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: Card(
                  child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        TeXView(
                          child: TeXViewDocument(item['question']),
                          renderingEngine:
                              const TeXViewRenderingEngine.mathjax(),
                        ),
                        ...item['alternatives']
                            .map((alternative) => CheckboxListTile(
                                  title: TeXView(
                                    child: TeXViewDocument(alternative['text']),
                                    renderingEngine:
                                        const TeXViewRenderingEngine.mathjax(),
                                  ),
                                  onChanged: (value) {},
                                  value: false,
                                ))
                            .toList(),
                        const SizedBox(
                          height: 100.0,
                        ),
                      ],
                    ),
                  ),
                  //  hacer un foreach con Text(item.questions.alternatives)
                  //  y un for con item.questions.alternatives

                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'Pregunta numero ${question.indexOf(item)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Examen'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CarouselSlider(
                items: questionsSliders,
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    height: MediaQuery.of(context).size.height * 0.7,
                    viewportFraction: 0.8),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.previousPage(),
                      child: const Text('←'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.nextPage(),
                      child: const Text('→'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

}
