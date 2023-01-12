import 'package:flutter/material.dart';

import 'package:kyla_task/core/extensions/extensions.dart';

import 'package:kyla_task/feature/home_page/presentation/widgets/brand.dart';
import 'package:kyla_task/feature/home_page/presentation/widgets/home_page_app_bar.dart';
import 'package:kyla_task/feature/home_page/presentation/widgets/shoes.dart';
import 'package:kyla_task/feature/home_page/presentation/widgets/shoes_list.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              height: context.getHeight() * 0.95,
              child: Column(
                children: [
                  const HomePageAppBar(),
                  Brand(),
                  const Shoes(),
                  moreWidget(),
                  const ShoesList(),
                ],
              ),
            ),
          ),
        );

  }

  Widget moreWidget() {
    return Container(
      child: Row(
        children: [
          const Text("More",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.arrow_forward_outlined),
            onPressed: () {},
          ),

        ],
      ),
    );
  }
}
