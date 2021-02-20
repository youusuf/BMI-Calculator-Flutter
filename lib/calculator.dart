import 'dart:math';

class Brain{
      final int height;
      final int weight;
      double bmi;
    Brain({this.weight,this.height});


    String calculateBMI(){
      bmi = weight/pow(height/100,2);
      return bmi.toStringAsFixed(1);
    }

    String getResult(){
      if(bmi>=25){
        return "OVERWEIGHT";
      }else if(bmi>18.5){
        return "NORMAL";
      }
      else{
        return "UNDERWEIGHT";
      }
    }


    String advice(){
      if(bmi>=25){
        return "EAT LESS";
      }else if(bmi>=18.5){
        return "PERFECT";
      }
      else{
        return "EAT MORE";
      }
    }

}