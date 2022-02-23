import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'calculatebmi.dart';

class Resultpage extends StatelessWidget {
  final String bmiresult;
  final String resulttext;
  final String interpretation;

  Resultpage({@required this.bmiresult, @required this.resulttext , @required this.interpretation});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('YOUR RESULT',
                  style: ktitletext,),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: Card(
                color: kfixcolor,
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(bmiresult,
                      style: kresulttext,),
                      Text(resulttext.toUpperCase(),
                      style: kBMItext,),
                      Text(interpretation,
                      textAlign: TextAlign.center,
                      style: kintreprettext,),
                    ],
                  )
    ),),
          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: kbottomfixclr,
                margin: EdgeInsets.only(top:20),
                height: kfixheight,
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text('RE-CALCULATE',
                      style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
