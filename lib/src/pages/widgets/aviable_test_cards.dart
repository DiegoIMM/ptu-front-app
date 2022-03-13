import 'package:flutter/material.dart';

class AviableTestCards extends StatelessWidget {
  String title;

  AviableTestCards({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  print('tap');
                  Navigator.pushNamed(context, 'examen', arguments: title);
                },
                child: const SizedBox(
                  height: 100,
                  width: 150,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 8,
                      child: Text('Test rápido'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tap');
                  Navigator.pushNamed(context, 'examen', arguments: title);
                },
                child: const SizedBox(
                  height: 100,
                  width: 150,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 8,
                      child: Text('Test global'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tap');
                  Navigator.pushNamed(context, 'examen', arguments: title);
                },
                child: const SizedBox(
                  height: 100,
                  width: 150,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 8,
                      child: Text('Test global'),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
