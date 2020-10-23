import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:twitter/screens/sample/auth/login_screen.dart';
import 'package:twitter/screens/sample/auth/register/register_screen.dart';
import 'package:twitter/widgets/button_primary.dart';
import 'package:twitter/widgets/form/rounded_input_container.dart';
import 'package:twitter/widgets/helpers/size_box_h1.dart';
import 'package:twitter/widgets/helpers/size_box_h5.dart';
import 'package:twitter/widgets/helpers/text_center.dart';
import 'package:twitter/widgets/rounded_input.dart';
import 'package:twitter/widgets/top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
                text: 'Forgot',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizeBoxH5(),
              SvgPicture.asset(
                'assets/svg/auth1.svg',
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
              ButtonPrimary(
                text: 'Forgot',
                onPress: () {},
              ),
              TextCenter(
                style: Theme.of(context).textTheme.bodyText1,
                text: 'Does not account? Register',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
