import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyla_task/core/extensions/extensions.dart';
import 'package:kyla_task/feature/bag/domain/entities/my_bag_entity.dart';



class MyBagItemWidget extends StatefulWidget {
  final MyBagEntity entity;
  final Function()? onAddPressed;
  final Function()? onRemovePressed;

  const MyBagItemWidget(
      {Key? key, required this.entity, this.onAddPressed, this.onRemovePressed})
      : super(key: key);

  @override
  State<MyBagItemWidget> createState() => _MyBagItemWidgetState();
}

class _MyBagItemWidgetState extends State<MyBagItemWidget>
    with SingleTickerProviderStateMixin {
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  late final AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _slideAnimation =
        Tween(begin: const Offset(3.0, 0), end: const Offset(0, 0))
            .animate(_controller);
    _scaleAnimation = Tween(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));
    _controller.addListener(() {
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.reverse();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 30, right: 40, left: 30),
      child: Row(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                padding: EdgeInsets.all(context.getWidth()*0.015),
                width: context.getWidth() * 0.25,
                height: context.getWidth() * 0.25,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
            Positioned(
              top: -context.getWidth() * 0.04,
              right: -context.getWidth() * 0.08,
              child: ScaleTransition(
                  scale: _scaleAnimation.drive(Tween(
                    begin: 1.3,
                    end: 1,
                  )),
                  alignment: Alignment.center,
                  child: Image.asset(
                    widget.entity.image,
                    width: context.getWidth() * 0.30,
                  )),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: TweenAnimationBuilder<double>(
              tween: Tween(
                begin: 0.0,
                end: 1.0
              ),
              builder: (c, opacity, widget) => Opacity(
                opacity: opacity,
                child: widget!,
              ),
              duration: const Duration(milliseconds: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideTransition(
                    position: _slideAnimation,
                    child: Text(
                      widget.entity.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("\$${widget.entity.price}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18)),
                    ),
                  ),
                  SlideTransition(
                      position: _slideAnimation,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildButton(
                              icon: Icons.add, onTap: widget.onAddPressed),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              "${widget.entity.quantity}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          buildButton(
                              icon: Icons.remove,
                              onTap: widget.onRemovePressed),
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildButton({required IconData icon, required Function()? onTap}) {
    return Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5)),
        child: InkWell(
          onTap: onTap,
          child: Icon(icon),
        ));
  }
}
