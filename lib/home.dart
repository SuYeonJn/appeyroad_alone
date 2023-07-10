import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<String> schedulesList = <String>[
    'schedule1',
    'schedule2',
    'schedule3',
    'schedule4'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('내 스케줄'),
        ),
        Expanded(
          flex: 5,
          child: Placeholder(
              child: Padding(
            padding: const EdgeInsets.all(100),
            child: Text('달력'),
          )),
        ),
        Expanded(
          flex: 5,
          child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: schedulesList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Text('${schedulesList[index]}'),
                  onTap: () {
                    print('${schedulesList[index]} selected');
                  },
                );
              }),
        )
      ],
    );
  }
}
