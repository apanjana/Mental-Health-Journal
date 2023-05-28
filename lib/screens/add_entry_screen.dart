// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:journal/components.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({Key? key}) : super(key: key);

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  TextEditingController titleControl=TextEditingController();
  TextEditingController entryControl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body: Container(
      width: double.infinity,
        height: double.infinity,
        decoration: kScreenBG,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            JournalTitle(),
            SizedBox(
              height: 10,
            ),
            Container(
              width: w*0.8,
              padding: EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 10,
              ),
              decoration: kTextField,
              child: Center(child: TextFormField(
                controller: titleControl,
                cursorColor: Colors.white,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Entry Title',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.7),
                ),
                ),
              ),),

            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                width: w*0.8,
                padding: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.5,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(
                    15,
                  ),
                  ),
                ),
                child: SingleChildScrollView(
                  reverse: entryControl.text.length>20?true:false,
                  child: Center(
                    child: TextFormField(
                      controller: entryControl,
                      cursorColor: Color(0xFF828267),
                      maxLines: 15,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        color: Color(0xFF828267),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Create new entry',
                        hintStyle: TextStyle(
                          color: Color(0xFF828267).withOpacity(0.4),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            JournalButton(label: "SAVE", fn: ()async{
              if(titleControl.text.isEmpty||entryControl.text.isEmpty) {
                print("Please enter title and entry :)");
              } else
                {
                  await FirebaseFirestore.instance.collection('entries').add({
                    'Title':titleControl.text,
                    'Entry':entryControl.text,
                    'Date':DateFormat.yMMMEd().add_jm().format(DateTime.now()),
                  }).then((value) => print("Entry added successfully =D"),)
                    .catchError((error)=> print("Entry not addded due to $error"));
                  titleControl.clear();
                  entryControl.clear();
                }
            }),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleControl.dispose();
    entryControl.dispose();
    super.dispose();
  }
}
