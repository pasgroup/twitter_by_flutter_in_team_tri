import 'package:flutter/material.dart';

class SizeBoxH1 extends StatelessWidget {
  const SizeBoxH1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.01,
    );
  }
}
