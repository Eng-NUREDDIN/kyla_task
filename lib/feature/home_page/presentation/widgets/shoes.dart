import 'dart:math';


import 'package:flutter/material.dart';
import 'package:kyla_task/core/extensions/extensions.dart';
import 'package:kyla_task/feature/home_page/presentation/widgets/shoe_card.dart';

class Shoes extends StatefulWidget {
  const Shoes({Key? key}) : super(key: key);

  @override
  _ShoesState createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
   final PageController _swiperController=PageController(
     viewportFraction: 0.8
   );
   double _pageOffset = 0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _swiperController.addListener(() {
      setState(() {
        _pageOffset = _swiperController.page??0;

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      //color: Colors.redAccent,
      width: context.getWidth(),
      height: context.getHeight() * 0.45,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              //color: Colors.redAccent,
              width: context.getWidth() * 0.1,
              height: context.getHeight() * 0.45,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: context.getWidth() * 0.1,
                      height: context.getHeight() * 0.1,
                      child:  Column(
                        children:  const [
                          RotatedBox(quarterTurns: 3,
                          child: Text("Upcoming",style: TextStyle(color: Colors.grey), ))
                        ],
                      ),
                    ),
                    Container(
                      width: context.getWidth() * 0.1,
                      height: context.getHeight() * 0.1,
                      child:  Column(
                        children:  const [
                          RotatedBox(quarterTurns: 3,
                              child: Text("Featured", ))
                        ],
                      ),
                    ),
                    Container(
                      width: context.getWidth() * 0.1,
                      height: context.getHeight() * 0.1,
                      child:  Column(
                        children:  const [
                          RotatedBox(quarterTurns: 3,
                              child: Text("New",style: TextStyle(color: Colors.grey) ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              //color: Colors.green,
              width: context.getWidth() * 0.98,
              height: context.getHeight() * 0.45,
              child: PageView.builder(
                controller: _swiperController,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  double _angle = -(_pageOffset - index)*pi/2;
                  // if(_angle>0.5){_angle = 1 - _angle;}
                  return  Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_angle),
                      child: ShoeCard(index,_pageOffset));
                },
              ),
            ),
          ),
        ],

      )
    );
  }
}
