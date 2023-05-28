// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:journal/screens/add_entry_screen.dart';
import '../constants.dart';
import '../components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: w,
          height: h,
          decoration: kScreenBG,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JournalTitle(),
              SizedBox(
                height: h*0.045,
              ),
              Image(image: AssetImage('images/Brain.png'),
                width: w*0.51,
                height: h*0.23,
              ),
              SizedBox(
                height: h*0.03,
                width: w*0.05,
              ),
              JournalButton(
                  label: 'Read Entries',
                  fn:(){}
              ),
              SizedBox(
                height: h*0.03,
                width: w*0.05,
              ),
              JournalButton(
                  label: 'Add Entry',
                  fn:(){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>AddEntryScreen(),),);
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
