import 'package:flutter/material.dart';

class SubjectsCards extends StatelessWidget {
  String subjectName;
  IconData subjectIcon;
  MaterialColor subjectColor;

  SubjectsCards({
    Key? key,
    required this.subjectName,
    required this.subjectIcon,
    required this.subjectColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          print('$subjectName was tapped!');
          Navigator.pushNamed(context, 'subject_overview',
              arguments: subjectName);
        },
        child: Card(
          color: subjectColor.shade100,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Icon(subjectIcon, size: 40, color: subjectColor)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(subjectName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: subjectColor,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
