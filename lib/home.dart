import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('내 스케줄'),
          ),
          Icon(Icons.star),
          Text('14'),
        ]),
        Placeholder(
            child: Padding(
          padding: const EdgeInsets.all(100),
          child: Text('달력'),
        )),
        FloatingActionButton(
            onPressed: () {
              print('dkdkd');
            },
            child: Icon(Icons.add)),
      ],
    );
  }
}
