import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/feature/bag/presentation/pages/my_bag_page.dart';

import 'package:kyla_task/feature/favorite/presentation/pages/favorite_page.dart';
import 'package:kyla_task/feature/home_page/presentation/manager/home_page_bloc.dart';
import 'package:kyla_task/feature/home_page/presentation/pages/app_home_page.dart';
import 'package:kyla_task/feature/location/presentation/pages/location_place.dart';
import 'package:kyla_task/feature/my_account/presentation/pages/my_account.dart';


class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }
  void switchPage(int index) {

    switch (index) {
      case 0:
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        break;
      case 1:
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        break;
      case 2:
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        break;
      case 3:
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        break;
      case 4:
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        switchPage(state.pageViewIndex);
        return PageView(
          controller: pageController,onPageChanged: (index){
             BlocProvider.of<HomePageBloc>(context).add(PagesEvent(index: index));

        },
          children:  [
            const AppHomePage(),
            const FavoritePage(),
            const LocationPLace(),
            MyBagPage(),
            const MyAccount(),

          ],
        );
      },
    );
  }
}
