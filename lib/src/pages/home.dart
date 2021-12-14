import 'package:flutter/material.dart';
import 'package:ptu/src/pages/widgets/subjects_cards.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PTU'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(children: [
                  SubjectsCards(
                      subjectName: 'Lenguaje',
                      subjectIcon: Icons.record_voice_over,
                      subjectColor: Colors.red),
                  SubjectsCards(
                      subjectName: 'Matemáticas',
                      subjectIcon: Icons.add,
                      subjectColor: Colors.green),
                ]),
                Row(children: [
                  SubjectsCards(
                      subjectName: 'Historia',
                      subjectIcon: Icons.account_balance,
                      subjectColor: Colors.blue),
                  SubjectsCards(
                      subjectName: 'Ingles',
                      subjectIcon: Icons.language,
                      subjectColor: Colors.purple),
                ]),
              ],
            ),
          ),
        ));
  }
}
