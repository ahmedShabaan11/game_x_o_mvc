import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({super.key, required this.text, required this.onPress});

  String text;
  void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(100)
          ),
          
          child: InkWell(
            onTap: onPress,
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
