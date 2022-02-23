import 'package:flutter/material.dart';
import 'constants.dart';
class malefemalebox extends StatelessWidget {
  final IconData icon;
  final String gender;
  malefemalebox({this.icon,this.gender});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70.0,

        ),
        SizedBox(height: 10.0,),
        Text(gender,
          style: klabeltext,)
      ],

    );
  }
}