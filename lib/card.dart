import 'input.dart';
import 'package:flutter/material.dart';
class card extends StatelessWidget {
  final Color colour;

  final Widget cardchild;
  final Function onpress;
  card({@required this.colour, this.cardchild, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onpress,
        child: Container(
          child: cardchild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),

        ),
      ),
    );
  }
}
