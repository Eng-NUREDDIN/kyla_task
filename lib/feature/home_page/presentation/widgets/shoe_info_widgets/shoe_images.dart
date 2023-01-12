import 'package:flutter/material.dart';
import 'package:kyla_task/core/extensions/extensions.dart';
import 'package:kyla_task/feature/home_page/domain/entities/shoe_info_entity.dart';

class ShoeImages extends StatelessWidget {
  final ShoeInfoEntity shoeInfoEntity;


  ShoeImages(this.shoeInfoEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.getHeight() * 0.48,
      child: Column(
        children: [
          Hero(
            tag: shoeInfoEntity.id,
            child: Stack(
              children: [
                Positioned(
                  left: -250 ,
                  bottom:0 ,
                  child: Container(
                    width: context.getWidth()*3.5,
                    height: context.getWidth()*3.5,
                    decoration: BoxDecoration(
                      color: Color(shoeInfoEntity.color),
                      shape: BoxShape.circle,
                      // borderRadius: const BorderRadius.only(
                      //   bottomLeft: Radius.circular(50),
                      //
                      //
                      // ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: context.getWidth() * 0.7,
                      child: Image.asset(shoeInfoEntity.image)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: context.getHeight() * 0.03),
            child: Container(
              width: double.infinity,
              height: context.getHeight() * 0.1,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      width: context.getWidth() * 0.3,
                      height: context.getHeight() * 0.1,
                      child: Image.asset(shoeInfoEntity.image),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20),
                  itemCount: 5),
            ),
          ),
        ],
      ),
    );
  }
}
