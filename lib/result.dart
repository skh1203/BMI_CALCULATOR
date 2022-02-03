import 'package:flutter/material.dart';
import 'cards.dart';

class Results extends StatelessWidget {
  Results({this.bmi,this.result,this.interpret});
  final String bmi;
  final String result;
  final String interpret;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('BMI CALCULATOR'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 12.0,
          ),
          Expanded(child: Container(child: Center(
            child: Text('YOUR RESULT',style:
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
              ),
              ),
          ))),
          Expanded(
            flex: 5,
              child: Newcon(
                colour: (Color(0xFF1D1E33)),
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      bmi.toUpperCase(),
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      interpret.toUpperCase(),
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    )


                  ],
                ),
              )

          )
        ],
      ),

      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          child: Center(child: Text('RE-CALCULATE',style: TextStyle(
            fontSize: 27.0,
            fontWeight: FontWeight.w900,
          ),)),
          color: Color(0xFFEB1555),
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: 68.0,
        ),
      ),
    );
  }
}
