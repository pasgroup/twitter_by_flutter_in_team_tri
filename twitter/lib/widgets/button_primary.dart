import 'package:flutter/material.dart';
import 'package:twitter/widgets/button.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({Key key, this.onPress, @required this.text}) : super(key: key);

  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: size.width * 0.05, horizontal: size.width * 0.1),
      child: Button(onPress: onPress, text: text),
    );
  }
}
