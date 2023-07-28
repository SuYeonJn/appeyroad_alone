import 'package:flutter/material.dart';
import 'loginPage.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});
  final List<String> myPageList = <String>['프로필 수정', '개인정보약관', '친구 관리', '설정'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: myPageList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(myPageList[index]),
              onTap: () {
                print('${myPageList[index]} selected');
              },
            );
          }),
    );
  }
}
