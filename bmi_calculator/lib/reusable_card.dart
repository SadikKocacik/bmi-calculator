import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardChild, this.ontap});

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
