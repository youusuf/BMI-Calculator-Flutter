import 'package:flutter/material.dart';
import 'package:flutter_angela/constants.dart';
import 'package:flutter_angela/reuse.dart';
import 'route.dart';

class Result extends StatelessWidget {
 final String title;
  final String result;
  final String advice;
  Result({this.result,this.title,this.advice});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RESULT"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child:Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text("Your Result",
                style: TextStyle(
                  fontSize: 25.0,
                ),
                ),
              )
          ),
          Expanded(
            flex: 5,
            child: Reuse(
              color: KActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style:TextStyle(
                      color: Colors.green,
                      fontSize: 30.0
                    ),
                  ),
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    advice,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ),

            BottomButton(
              buttonTitle: "RECALCULATE",
              onTap:(){
                Navigator.pop(context);
              },
            )


        ],
      ),
    );
  }
}
