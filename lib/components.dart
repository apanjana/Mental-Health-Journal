// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import './constants.dart';

class JournalTitle extends StatelessWidget {
  const JournalTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text('H e a l t h y  M i n d',
        style: TextStyle(
          fontSize: 50,
          fontFamily: 'Pangolin',
          fontWeight: FontWeight.bold,
          foreground: Paint()..style=PaintingStyle.stroke..strokeWidth=10..color=Color(
              0xFF828267),
        ),
        ),
        Text('H e a l t h y  M i n d',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontFamily: 'Pangolin',
          color: Color(0xFF828267),
        ),
        )
      ],
    );
  }
}

class JournalButton extends StatelessWidget {
  final String label;
  final fn;
  const JournalButton({Key? key, required this.label, required this.fn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: fn,
        child: Container(
          width: w*0.8,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 3
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30,),
            ),
            border: Border.all(
              width: 3,
              color: Color(0xFF828267)
            ),
        ),
        child: Center(
          child: Text(
            label,
            style: kButtonText.copyWith(color: Color(0xFF828267)),
          ),
        ),
      ),
    );
  }
}



