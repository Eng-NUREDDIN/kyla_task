import 'dart:math';


import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/core/extensions/extensions.dart';
import 'package:kyla_task/feature/home_page/presentation/manager/home_page_bloc.dart';
import 'package:kyla_task/feature/home_page/presentation/pages/shoe_info.dart';

class ShoeCard extends StatefulWidget {
  int index;
  double offset;

  ShoeCard(this.index,this.offset);

  @override
  _ShoeCardState createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;



  @override
  void initState() {

    _controller =
        AnimationController(vsync: this, duration:const Duration(seconds: 1))
          ..addListener(() {

            setState(() {});
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
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Hero(
          tag: state.shoeData[widget.index].id,
          child: Container(
            width: context.getWidth() * 0.4,
            height: context.getHeight() * 0.4,
            child: GestureDetector(

              onTap: () {
                //Navigator.pushNamed(context, "/shoe_details");
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShoeInfo(state.shoeData[widget.index]),
                ));
              },
              child: Card(
                clipBehavior: Clip.none,
                elevation: 0,
                color: Colors.transparent,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(

                        child: Container(
                          width: context.getWidth() * 0.55,
                          decoration: BoxDecoration(
                              color: Color(state.shoeData[widget.index].color),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                width: context.getWidth() * 0.5,
                                height: context.getHeight() * 0.18,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                              state
                                                  .shoeData[widget.index].brand,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                          const Spacer(),
                                          Icon(
                                            Icons.favorite_border,
                                            color: state.shoeData[widget.index]
                                                    .isFavorite
                                                ? Colors.red
                                                : Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            state.shoeData[widget.index].name,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            state.shoeData[widget.index].price,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    Positioned(
                      left: 50,
                      //right: _controller.value,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..leftTranslate(-(widget.index-widget.offset).abs()*context.getWidth())
                        ..rotateZ(-(pi/3)*(widget.index-widget.offset)),
                        child: Container(
                        width: context.getWidth() * 0.65,
                        height: context.getHeight() * 0.4,
                        child: Image.asset(
                          state.shoeData[widget.index].image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      ),
            )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
