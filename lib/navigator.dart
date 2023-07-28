import 'package:flutter/material.dart';
import 'homePage.dart';
import 'mypage.dart';
import 'teamPage.dart';
import 'friendPage.dart';
import 'loginPage.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<NavigatorBar> {
  int currentPageIndex = 0;
  final user_validation = 'okay';

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (currentPageIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = TeamPage();
        break;
      case 2:
        page = FriendsPage();
        break;
      case 3:
        page = MyPage();
        break;
      default:
        throw UnimplementedError('no widget for');
    }

    if (user_validation == 'okay') {
      return Scaffold(
          appBar: AppBar(
            shape: Border(
                bottom: BorderSide(
                    color: Color.fromARGB(173, 148, 148, 148), width: 0.4)),
            //centerTitle: true,
            //backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            title: Row(
              children: [
                Icon(Icons.calendar_month),
                SizedBox(width: 10),
                Text('CALENDAR'),
              ],
            ),
          ),
          body: page,
          bottomNavigationBar: NavigationBar(
            surfaceTintColor: Color.fromARGB(255, 205, 205, 205),
            backgroundColor: Color.fromARGB(231, 255, 255, 255),
            indicatorColor: Color.fromARGB(238, 234, 234, 234),
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.people), label: 'Teams'),
              NavigationDestination(
                  icon: Icon(Icons.add_reaction_sharp), label: 'Friends'),
              NavigationDestination(
                  icon: Icon(Icons.settings), label: 'MyPage'),
            ],
          ));
    } else {
      return LoginPage();
    }
  }
}
