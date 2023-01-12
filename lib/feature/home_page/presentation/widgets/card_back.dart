import 'package:flutter/material.dart';

class CardBack extends StatefulWidget {
  const CardBack({required Key key}) : super(key: key);

  @override
  _CardBackState createState() => _CardBackState();
}

class _CardBackState extends State<CardBack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
