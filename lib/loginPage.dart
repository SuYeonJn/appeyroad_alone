import 'package:flutter/material.dart';
import 'navigator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        //앱 테스트를 위한 임시 로그인 스킵
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NavigatorBar();
          }));
        },
        child: Text('Skip Login',
            style: TextStyle(color: Colors.black, fontSize: 30)),
        style: TextButton.styleFrom(side: BorderSide(style: BorderStyle.solid)),
      ),
    );
  }
}
