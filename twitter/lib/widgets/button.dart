import 'package:flutter/material.dart';
import 'package:twitter/constants.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.onPress,
    @required this.text,
  }) : super(key: key);

  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      onPressed: onPress,
      child: Text(
        text,
        style: kButtonPrimary,
      ),
    );
  }
}
