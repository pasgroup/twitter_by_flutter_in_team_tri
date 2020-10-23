import 'package:flutter/material.dart';

class SizeBoxW05 extends StatelessWidget {
  const SizeBoxW05({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.05,
    );
  }
}
