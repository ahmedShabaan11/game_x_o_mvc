
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
   DetailWidget({super.key,required this.text2 ,required this.text1});
String text1;
String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(color: Colors.deepOrangeAccent ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
             text1,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                width: 20,
              ),
              Text(text2,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
