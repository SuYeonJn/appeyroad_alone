import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:from_to_time_picker/from_to_time_picker.dart';

import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: FriendsList(),
    );
  }
}

class FriendsList extends StatefulWidget {
  const FriendsList({super.key});

  @override
  State<FriendsList> createState() => _FriendsListState();
}

Map friendsDialogContents = {
  'title': '친구 추가하기',
  'contents': '친구 추가한 후 스케줄을 추가하세요!',
  'confirmBtn': '확인'
};
Future<void> _dialogBuilder(
    BuildContext context, titleContent, contents, confirmBtn) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('${titleContent}'),
        content: Text('${contents}'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('나가기'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text('${confirmBtn}'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TeamMaker()),
              );
            },
          ),
        ],
      );
    },
  );
}

class _FriendsListState extends State<FriendsList> {
  final List<String> friendsList = <String>[
    'friend1',
    'friend2',
    'friend3',
    'friend4'
  ];
  final List<String> teamList = <String>['Team1', 'Team2', 'Team3', 'Team4'];

  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: const [
            Tab(text: "Follower"),
            Tab(text: "Following"),
          ],
        ),
        body: TabBarView(children: <Widget>[
          ListsWidget(
            lists: teamList,
            subjective: '팀',
          ),
          ListsWidget(
            lists: friendsList,
            subjective: '친구',
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _dialogBuilder(
                  context,
                  friendsDialogContents['title'],
                  friendsDialogContents['contents'],
                  friendsDialogContents['confirmBtn']);
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListsWidget extends StatefulWidget {
  ListsWidget({super.key, required this.lists, this.subjective});

  final List<String> lists;
  var subjective;

  @override
  State<ListsWidget> createState() => _ListsWidgetState();
}

class _ListsWidgetState extends State<ListsWidget> {
  @override
  Widget build(BuildContext context) {
    //팝업창 만드는 함수

    return Column(
      children: [
        Expanded(
          child: SearchAnchor.bar(
            barHintText: '${widget.subjective} 만들기',
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<Widget>.generate(
                5,
                (int index) {
                  return ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('Initial list item $index'),
                  );
                },
              );
            },
          ),
        ),
        Expanded(
          flex: 8,
          child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: widget.lists.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text('${widget.lists[index]}'),
                  onTap: () {
                    print('${widget.lists[index]} selected');
                  },
                );
              }),
        ),
      ],
    );
  }
}

class TeamMaker extends StatefulWidget {
  const TeamMaker({super.key});

  @override
  State<TeamMaker> createState() => _TeamMakerState();
}

class _TeamMakerState extends State<TeamMaker> {
  DateTimeRange? myDateRange;

  String startTime = 'from';
  String endTime = 'to'
      '';

  double _currentSliderValue = 0.0;
  String? _sliderStatus;

  void showLightTimePicker() {
    showDialog(
        context: context,
        builder: (_) => FromToTimePicker(
              onTab: (from, to) {
                print('from $from to $to');
                setState(() {
                  startTime = from.hour.toString();
                  endTime = to.hour.toString();
                });
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('팀 만들기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 100,
                      height: 40,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '팀 이름',
                        ),
                      )),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Complete'),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Text('날짜 선택'),
                ),
                DateRangeField(
                    enabled: true,
                    initialValue: DateTimeRange(
                        start: DateTime.now(),
                        end: DateTime.now().add(Duration(days: 5))),
                    decoration: InputDecoration(
                      labelText: 'Date Range',
                      prefixIcon: Icon(Icons.date_range),
                      hintText: 'Please select a start and end date',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.start.isBefore(DateTime.now())) {
                        return 'Please enter a later start date';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        myDateRange = value!;
                      });
                    }),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Text('시간 선택'),
                ),
                SizedBox(
                    width: 430,
                    child: TextField(
                      onTap: () => showLightTimePicker(),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '$startTime to $endTime',
                      ),
                    ))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Text('약속 시간'),
                ),
                //  CupertinoSliderApp()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
