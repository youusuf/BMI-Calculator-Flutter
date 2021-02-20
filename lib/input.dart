import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';
import 'package:flutter_angela/results_page.dart';
import 'package:flutter_angela/route.dart';
import 'reuse.dart';
import 'iconContent.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 120;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuse(
                    onTap:(){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender==Gender.male?KActiveColor:KInActiveColor,
                    cardChild: IconContent(
                      gender: "MALE",
                    icon: FontAwesomeIcons.mars,
                    ),

                  ),
                ),
                Expanded(
                  child:Reuse(
                    onTap:(){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                      color: selectedGender==Gender.female?KActiveColor:KInActiveColor,
                    cardChild: IconContent(
                      gender: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),

                ),
              ],
            ),
          ),
          Expanded(
            child: Reuse(
              color: KActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text("HEIGHT",
                      style: KLabelTextStyle,
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(height.toString(),style: KTextStyle,),
                      Text("cm",style: KLabelTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                      thumbColor: Colors.pink,
                        inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Colors.pink[900],
                      activeTrackColor: Colors.white
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 120,


                      onChanged:(double val){
                        setState(() {
                          height = val.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuse(color: KActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT",style:KLabelTextStyle),
                        Text(weight.toString(),style:KTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPress:(){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(width: 5.0,),
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPress:(){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:Reuse(color: KActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE",style:KLabelTextStyle,),
                      Text(age.toString(),style: KTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(icon: FontAwesomeIcons.minus,
                          onPress:(){
                            setState(() {
                              age--;
                            });
                          },
                          ),
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPress:(){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  ),
                )
              ],
            ),
          ),
         BottomButton(
           buttonTitle: "CALCULATE",
           onTap:(){
             Brain brain = Brain(height: height,weight: weight);
             Navigator.push(context, MaterialPageRoute(builder:(context)=>Result(
               result: brain.calculateBMI(),
               title: brain.getResult(),
               advice: brain.advice(),
             )));

           },
         ),
        ],
      )
    );
  }
}
class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  RoundButton({this.icon,this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10.0,
      onPressed:onPress,
      child:Icon(icon),
      constraints: BoxConstraints.tightFor(
        height: 40,
        width: 40
      ),
      shape:CircleBorder(
      ),
      fillColor: Colors.blue,
    );
  }
}


