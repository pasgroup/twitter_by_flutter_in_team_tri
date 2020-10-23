import 'package:flutter/material.dart';
import 'package:twitter/screens/sample/auth/login_screen.dart';
import 'package:twitter/widgets/button.dart';
import 'package:twitter/widgets/button_primary.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('body'),
            ButtonPrimary(
              text: 'Login',
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
