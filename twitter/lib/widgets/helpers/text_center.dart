import 'package:flutter/material.dart';

class TextCenter extends StatelessWidget {
  const TextCenter(
      {Key key, @required this.text, @required this.style, this.onTap})
      : super(key: key);

  final TextStyle style;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
