import 'dart:math';

class Brain{
  Brain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculator(){
    _bmi=weight/pow(height/100, 2);
    String a=_bmi.toStringAsFixed(1);

    return a;
}

  String result(){
    if(_bmi>=25.0){
      return 'Overweight';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String interpret(){
    if(_bmi>=25.0){
      return 'You gotta exercise more';
    }
    else if(_bmi>18.5){
      return 'Great Job';
    }
    else{
      return 'You gotta eat more';
    }
  }

}
