import 'package:flutter/material.dart';
import 'package:twitter/constants.dart';

class RoundedInputPassword extends StatelessWidget {
  const RoundedInputPassword({Key key, @required this.iconData, @required this.hint, this.onChanged}) : super(key: key);

  final IconData iconData;
  final String hint;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              iconData,
              color: kTextPrimaryColor,
            ),
            hintText: hint),
      ),
    );
  }
}
