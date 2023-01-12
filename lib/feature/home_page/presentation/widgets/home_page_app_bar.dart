import 'package:flutter/material.dart';
import 'package:kyla_task/core/extensions/extensions.dart';

class HomePageAppBar extends StatelessWidget {
   const HomePageAppBar({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.getHeight() * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Discover",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
