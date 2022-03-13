
import 'package:flutter/material.dart';

class AreaOrHabilityCards extends StatelessWidget {
  String title;

  AreaOrHabilityCards({Key? key, required this.title}) : super(key: key);

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
                  Navigator.pushNamed(context, 'area_or_hability_detail', arguments: title);
                },
                child: const SizedBox(
                  height: 200,
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Card(
                      elevation: 8,
                      child: Text('Geometría'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tap');
                  Navigator.pushNamed(context, 'area_or_hability_detail', arguments: title);
                },
                child: const SizedBox(
                  height: 200,
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Card(
                      elevation: 8,
                      child: Text('Algebra'),
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
