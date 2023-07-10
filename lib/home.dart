import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

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
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text('내 스케줄'),
              ),
              Expanded(
                  flex: 7,
                  child: WeekView(
                    heightPerMinute: 0.5,
                  )),
              Expanded(
                flex: 5,
                child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: schedulesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(Icons.calendar_month),
                        title: Text(schedulesList[index]),
                        onTap: () {
                          print('${schedulesList[index]} selected');
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
