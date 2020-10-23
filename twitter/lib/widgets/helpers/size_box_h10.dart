import 'package:flutter/material.dart';

class SizeBoxH10 extends StatelessWidget {
  const SizeBoxH10({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.1,
    );
  }
}
