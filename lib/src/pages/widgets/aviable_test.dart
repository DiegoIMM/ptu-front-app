import 'package:flutter/material.dart';

class AviableTest extends StatelessWidget {
  String title;

  AviableTest({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 200,
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Card(elevation: 8, child: Text('General'),),
                  ),
                ),
              ),
              Card(
                child: Container(
                    height: 150, width: 200, child: Text('Geometria')),
              ),
              Card(
                child: Container(
                    height: 150, width: 200, child: Text('Estadistica')),
              ),
              Card(
                child: Container(height: 150, width: 200, child: Text('Sumas')),
              ),
              Card(
                child:
                    Container(height: 150, width: 200, child: Text('Restas')),
              ),
              Card(
                child: Container(
                    height: 150, width: 200, child: Text('Multiplicaciones')),
              ),
              Card(
                child: Container(
                    height: 150, width: 200, child: Text('Divisiones')),
              )
            ]),
          )
        ],
      ),
    );
  }
}
