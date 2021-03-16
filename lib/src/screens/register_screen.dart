import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static final String route = '/register';

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('This is Register screen'),
        ),
        body: TextButton(
          child: Text('Go to login screen'),
          onPressed: () => Navigator.pushNamed(context, LoginScreen.route),
        ));
  }
}
