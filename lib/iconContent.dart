import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
class IconContent extends StatelessWidget {
  final IconData icon;
  final String gender;
  IconContent({this.gender,this.icon});
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50.0,
          color: Colors.white,
        ),
        SizedBox(height: 5.0,),
        Text(gender,style: KLabelTextStyle,)
      ],
    );
  }
}
