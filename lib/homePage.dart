import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter_application_2/loginPage.dart';

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
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('My Schedule'),
            ),
            Expanded(
                flex: 7,
                child: WeekView(
                  width: 450,
                  heightPerMinute: 0.5,
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text('예정된 스케줄'),
            )),
            Expanded(
              flex: 5,
              child: ListView.builder(
                  padding: const EdgeInsets.all(15),
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
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Text('로그인'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }),
              );
            }),
      ),
    );
  }
}
