import 'package:flutter/material.dart';
import 'package:ptu/src/pages/widgets/aviable_test_cards.dart';

class AreaOrHabilityDetailPage extends StatefulWidget {
  final argument;

  const AreaOrHabilityDetailPage({Key? key, required this.argument})
      : super(key: key);

  @override
  _AreaOrHabilityDetailPageState createState() =>
      _AreaOrHabilityDetailPageState();
}

class _AreaOrHabilityDetailPageState extends State<AreaOrHabilityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area or Hability Detail'),
      ),
      body: ListView(
        children: [
          const Placeholder(
            fallbackHeight: 200,
          ),
          AviableTestCards(
            title: 'Test disponibles',
          ),
        ],
      ),
    );
  }
}
