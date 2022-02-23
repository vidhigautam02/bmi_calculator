import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card.dart';
import 'malefemalebox.dart';
import 'resultpage.dart';
import 'constants.dart';
import 'calculatebmi.dart';
enum Genderchoose{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolor = kinactivecolor;
  Color femalecardcolor = kinactivecolor;
  int height = 180;
  int weight = 60;
  int age = 12;

  void updatecolour(Genderchoose genderselected) {
    if (genderselected == Genderchoose.male) {
      if (malecardcolor == kinactivecolor) {
        malecardcolor = kfixcolor;
        femalecardcolor = kinactivecolor;
      } else {
        malecardcolor = kinactivecolor;
      }
    } else {
      if(femalecardcolor == kinactivecolor){
      femalecardcolor = kfixcolor;
      malecardcolor = kinactivecolor;
      }else{
        femalecardcolor = kinactivecolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Expanded(
              child: Row(
                children: [
                  card(
                    onpress: (){
                      setState(() {
                        updatecolour(Genderchoose.male);
                      });
                    },
                    colour: malecardcolor,
                    cardchild: malefemalebox(icon: FontAwesomeIcons.mars, gender: 'MALE'),
                  ),
                  card(colour: femalecardcolor,
                  onpress: (){
                    setState(() {
                      updatecolour(Genderchoose.female);
                    });
                  },
                  cardchild: malefemalebox(icon: FontAwesomeIcons.venus,gender: 'FEMALE',),),
                ]
              ),
            ),
          
          card(colour: kfixcolor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',
                style: klabeltext,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),
                    style: knumbertext,),
                    Text('cm',
                    style: klabeltext,),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newvalue){
                        setState(() {
                          height = newvalue.round();
                        });
                  },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                card(colour: kfixcolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                      style: klabeltext,),
                      Text(weight.toString(),
                      style: knumbertext,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                        roundbutton(
                            icon: FontAwesomeIcons.minus,
                            onpresed:() {
                              setState(() {
                                weight--;
                              });
                            }
                        ),
                        SizedBox(width: 15.0,),
                        roundbutton(
                          icon: FontAwesomeIcons.plus,
                          onpresed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        )
                      ],)
                    ],
                  ),

                ),
                card(colour: kfixcolor,
                  cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE',
                      style: klabeltext,),
                    Text(age.toString(),
                      style: knumbertext,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        roundbutton(
                            icon: FontAwesomeIcons.minus,
                            onpresed:() {
                              setState(() {
                                age--;
                              });
                            }
                        ),
                        SizedBox(width: 15.0,),
                        roundbutton(
                          icon: FontAwesomeIcons.plus,
                          onpresed: (){
                            setState(() {
                              age++;
                            });
                          },
                        )
                      ],)
                  ],
                ),),
              ],
            )
          ),
          GestureDetector(
            onTap: (){
              Calculatebmi calc = Calculatebmi(weight:weight, height:height);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Resultpage(
                  bmiresult: calc.calculate(),
                  resulttext: calc.getresult(),
                  interpretation: calc.getinterpretation(),
                );
              }));
            },
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('CALCULATE',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              color: kbottomfixclr,
              margin: EdgeInsets.only(top:20),
              height: kfixheight,
              width: double.infinity,
            ),
          ),
        ],
      ),

    );
  }
}

class roundbutton extends StatelessWidget {

 final IconData icon;
 final Function onpresed;
 roundbutton({this.icon,this.onpresed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:onpresed,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4FE),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(height:56.0 ,width:56.0 ),
    );
  }
}
