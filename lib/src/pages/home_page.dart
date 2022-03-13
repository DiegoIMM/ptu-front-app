import 'package:flutter/material.dart';
import 'package:ptu/src/pages/widgets/subjects_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PTU'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(children: [
                      SubjectsCard(
                          subjectName: 'Lenguaje',
                          subjectIcon: Icons.record_voice_over,
                          subjectColor: Colors.red),
                      SubjectsCard(
                          subjectName: 'Matemáticas',
                          subjectIcon: Icons.add,
                          subjectColor: Colors.green),
                    ]),
                    Row(children: [
                      SubjectsCard(
                          subjectName: 'Historia',
                          subjectIcon: Icons.account_balance,
                          subjectColor: Colors.blue),
                      SubjectsCard(
                          subjectName: 'Ingles',
                          subjectIcon: Icons.language,
                          subjectColor: Colors.purple),
                    ]),
                  ],
                ),
                const Center(
                  child: Placeholder(
                    fallbackHeight: 80,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
