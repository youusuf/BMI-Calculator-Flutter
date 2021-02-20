import 'package:flutter/material.dart';

class Reuse extends StatelessWidget {
  Reuse({@required this.color,this.cardChild,this.onTap});
  final Color color;
  final Widget cardChild;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
          margin: EdgeInsets.all(15.0),
          child: cardChild,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0)
          ),

      ),
    );
  }
}
