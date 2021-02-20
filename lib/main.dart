import 'package:flutter/material.dart';
import 'input.dart';
void main(){
  runApp(BMICalculator());
}
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:Color(0xFF0A0E21),
        scaffoldBackgroundColor:Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white)
        )
      ),
      home: InputPage(),
    );
  }
}
