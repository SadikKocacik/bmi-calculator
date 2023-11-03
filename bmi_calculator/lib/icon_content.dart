import 'package:flutter/material.dart';
import 'constans.dart';

class IconContent extends StatelessWidget {
  // const IconContent({Key? key, this.ican, this.yazi}) : super(key: key);
  const IconContent({super.key, required this.ican, required this.yazi});

  final IconData ican;
  final String yazi;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ican,
          size: 80,
        ),
        SizedBox(
          height: 18,
        ),
        Text(
          yazi,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
