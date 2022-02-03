import 'package:flutter/material.dart';

class Carddata extends StatelessWidget {
  Carddata({@required this.icon,this.gender});
  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0XFF8D8E98),
          ),
        ),
      ],
    );
  }
}

