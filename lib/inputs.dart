import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cards.dart';
import 'card_contents.dart';
import 'result.dart';
import 'calculator.dart';

const oncolor = Color(0xFF1D1E33);
const offcolor = Color(0xFF111328);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height = 180;
  int w = 60;
  int age=18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Newcon(
                      onpressed: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      cardchild: Carddata(
                        icon: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                      colour:
                          selectedgender == Gender.male ? oncolor : offcolor,
                    ),
                  ),
                  Expanded(
                    child: Newcon(
                      onpressed: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      cardchild: Carddata(
                        icon: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      ),
                      colour:
                          selectedgender == Gender.female ? oncolor : offcolor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Newcon(
                colour: oncolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Color(0XFF8D8E98),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 29.0,
                            color: Color(0XFF8D8E98),
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
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
                    child: Newcon(
                      colour: oncolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0XFF8D8E98),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                w.toString(),
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'kg',
                                style: TextStyle(
                                  fontSize: 29.0,
                                  color: Color(0XFF8D8E98),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Roundicon(
                                onPressed: () {
                                  setState(() {
                                    w--;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Roundicon(
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                ),
                                onPressed: () {
                                  setState(() {
                                    w++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Newcon(
                      colour: oncolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0XFF8D8E98),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                age.toString(),
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Roundicon(
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                ),
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Roundicon(
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                ),
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: (){
                Brain calc=Brain(height: height,weight: w);

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Results(
                    bmi: calc.calculator(),
                    result: calc.result(),
                    interpret: calc.interpret(),
                  );
                }));
              },
              child: Container(
                child: Center(child: Text('CALCULATE',style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w900,
                ),)),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 68.0,
              ),
            )
          ],
        ));
  }
}

class Roundicon extends StatelessWidget {
  Roundicon({@required this.child, this.onPressed});
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      shape: CircleBorder(),
      onPressed: () {
        onPressed();
      },
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
