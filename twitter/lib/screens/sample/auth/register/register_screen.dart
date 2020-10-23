import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:twitter/screens/sample/auth/forgot/forgot_screen.dart';
import 'package:twitter/screens/sample/auth/login_screen.dart';
import 'package:twitter/widgets/button_primary.dart';
import 'package:twitter/widgets/form/rounded_input_container.dart';
import 'package:twitter/widgets/helpers/size_box_h1.dart';
import 'package:twitter/widgets/helpers/size_box_h5.dart';
import 'package:twitter/widgets/helpers/text_center.dart';
import 'package:twitter/widgets/rounded_input.dart';
import 'package:twitter/widgets/rounded_input_password.dart';
import 'package:twitter/widgets/top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TopBar(
                text: "Login",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
              ),
              SizeBoxH5(),
              TextCenter(
                text: 'Register',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizeBoxH5(),
              SvgPicture.asset(
                'assets/svg/auth2.svg',
                height: screenSize.height * 0.3,
              ),
              RoundedInputContainer(
                child: RoundedInput(
                  iconData: FeatherIcons.user,
                  hint: "email",
                  onChanged: (value) {},
                ),
              ),
              SizeBoxH1(),
              RoundedInputContainer(
                child: RoundedInputPassword(iconData: FeatherIcons.shield, hint: 'password'),
              ),
              SizeBoxH1(),
              RoundedInputContainer(
                child: RoundedInputPassword(iconData: FeatherIcons.shield, hint: 'retype-password'),
              ),
              ButtonPrimary(
                text: 'Register',
                onPress: () {},
              ),
              SizeBoxH1(),
              TextCenter(
                text: 'Forgot password?',
                style: Theme.of(context).textTheme.bodyText1,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return ForgotScreen();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
