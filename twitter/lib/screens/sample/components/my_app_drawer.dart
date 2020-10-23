import 'package:flutter/material.dart';
import 'package:twitter/screens/sample/auth/login_screen.dart';
import 'package:twitter/screens/sample/auth/register/register_screen.dart';
import 'package:twitter/services/app_storage.dart';
import 'package:twitter/widgets/button.dart';
import 'package:twitter/widgets/helpers/size_box_w05.dart';

class MyAppDrawer extends StatelessWidget {
  MyAppDrawer({this.loggedIn});

  final bool loggedIn;
  AppStorage _storage = AppStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            (!loggedIn)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        text: "Login",
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                      ),
                      SizeBoxW05(),
                      Button(
                        text: "Register",
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return RegisterScreen();
                          }));
                        },
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        text: 'Logout',
                        onPress: () async {
                          await _storage.removeJwtToken();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
