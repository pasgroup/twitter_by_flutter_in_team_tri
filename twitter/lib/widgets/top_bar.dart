import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:twitter/constants.dart';

class TopBar extends StatelessWidget {
  TopBar({Key key, this.onTap, this.text = ''}) : super(key: key);

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Icon(
                  FeatherIcons.chevronLeft,
                  color: kTextPrimaryColor,
                ),
                Text(text),
              ],
            ),
          )
        ],
      ),
    );
  }
}
