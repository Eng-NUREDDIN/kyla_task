import 'package:flutter/material.dart';

class KylaButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  double width;
  double height;
   KylaButton({Key? key, required this.onPressed, required this.text,this.width = 50,this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width,height),
        backgroundColor: Colors.pink
      ), child:  Text(text,style: const TextStyle(
      color: Colors.white70
    ),),
    );
  }
}
