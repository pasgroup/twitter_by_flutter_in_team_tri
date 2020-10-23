import 'package:flutter/material.dart';
import 'package:twitter/constants.dart';

class RoundedInputContainer extends StatelessWidget {
  RoundedInputContainer({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.8,
      margin: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.1,
      ),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: kSoftPrimaryBackgroundColor),
      child: child,
    );
  }
}
