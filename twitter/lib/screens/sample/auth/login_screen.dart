import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:twitter/apis/auth.dart';
import 'package:twitter/constants.dart';
import 'package:twitter/screens/sample/auth/forgot/forgot_screen.dart';
import 'package:twitter/screens/sample/auth/register/register_screen.dart';
import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/services/app_storage.dart';
import 'package:twitter/services/helpers.dart';
import 'package:twitter/widgets/button_primary.dart';
import 'package:twitter/widgets/form/rounded_input_container.dart';
import 'package:twitter/widgets/helpers/size_box_h1.dart';
import 'package:twitter/widgets/helpers/size_box_h5.dart';
import 'package:twitter/widgets/helpers/text_center.dart';
import 'package:twitter/widgets/rounded_input.dart';
import 'package:twitter/widgets/rounded_input_password.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool requesting = false;

  Helpers helpers;

  @override
  void initState() {
    super.initState();
    helpers = Helpers();
  }

  Future<void> login(String email, String password) async {
    //validate
    if (email.length == 0 || password.length == 0) {
      helpers.dialog(context: context, title: 'Login', description: 'Pls fill your email/pass');
    } else {
      try {
        setState(() {
          requesting = true;
        });
        Auth auth = Auth();
        Response response = await auth.login(email, password);

        if (response.statusCode != 200) {
          helpers.assetDialog(
              context: context,
              image: Image.asset(
                'assets/images/fill_form.png',
              ),
              title: 'Login',
              message: helpers.firstError(response),
              onOkPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  requesting = false;
                });
              });
        } else {
          Map data = helpers.getJson(response.body);
          AppStorage storage = AppStorage();
          await storage.setJwtToken(data['access_token']);
          await storage.setRefreshToken(data['refresh_token']);
          helpers.assetDialog(
              context: context,
              image: Image.asset(
                'assets/images/login.png',
              ),
              title: 'Login',
              message: "Login success",
              onOkPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
                setState(() {
                  requesting = false;
                });
              });
        }
      } catch (e) {
        helpers.assetDialog(
            context: context,
            image: Image.asset('assets/images/bug_fixed.png'),
            title: "Error",
            message: "A error when call api",
            onOkPressed: () {
              Navigator.pop(context);
              setState(() {
                requesting = false;
              });
            });
      }
    }
  }

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
              SizeBoxH5(),
              TextCenter(
                text: 'Login',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizeBoxH5(),
              SvgPicture.asset(
                'assets/svg/auth.svg',
                height: screenSize.height * 0.3,
              ),
              requesting
                  ? Container(
                      child: SpinKitFadingCircle(
                        color: kPrimaryColor,
                        size: 80.0,
                      ),
                    )
                  : Container(
                      child: Column(
                        children: [
                          RoundedInputContainer(
                            child: RoundedInput(
                              iconData: FeatherIcons.user,
                              hint: "email",
                              onChanged: (value) {
                                email = value;
                              },
                            ),
                          ),
                          SizeBoxH1(),
                          RoundedInputContainer(
                            child: RoundedInputPassword(
                              iconData: FeatherIcons.shield,
                              hint: 'password',
                              onChanged: (value) {
                                password = value;
                              },
                            ),
                          ),
                          ButtonPrimary(
                            text: 'Login',
                            onPress: requesting
                                ? null
                                : () async {
                                    await login(email, password);
                                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
